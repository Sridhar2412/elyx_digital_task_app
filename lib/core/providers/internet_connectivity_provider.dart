import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/shared/model/user_state.dart';
import '../extension/log.dart';

part 'internet_connectivity_provider.g.dart';

@Riverpod(keepAlive: true)
class InternetConnectionState extends _$InternetConnectionState {
  @override
  UserState<bool> build() {
    observe();
    return const UserState(data: true);
  }

  Future<void> observe() async {
    final data = await Connectivity().checkConnectivity();
    await isNetworkAvailable(data);
    Connectivity().onConnectivityChanged.listen(isNetworkAvailable);
  }

  Future<void> isNetworkAvailable(List<ConnectivityResult> newEvent) async {
    final types = [
      ConnectivityResult.wifi,
      ConnectivityResult.ethernet,
      ConnectivityResult.mobile,
    ];

    'Connectivity Results: $newEvent'.logInfo('Connectivity');

    bool available = false;
    for (final element in types) {
      if (newEvent.contains(element)) {
        available = true;
        break;
      }
    }

    if (available) {
      try {
        final hosts = ['google.com', '1.1.1.1', '8.8.8.8'];
        bool hasAccess = false;

        for (final host in hosts) {
          try {
            final result = await InternetAddress.lookup(host)
                .timeout(const Duration(seconds: 3));
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
              'DNS Lookup Success: $host'.logInfo('Connectivity');
              hasAccess = true;
              break;
            }
          } catch (e) {
            'DNS Lookup Failed: $host ($e)'.logWarning();
            continue;
          }
        }

        if (!hasAccess) {
          'All DNS Lookups Failed. Trying HTTPS ping...'.logWarning();
          try {
            final client = HttpClient();
            client.connectionTimeout = const Duration(seconds: 5);
            final request =
                await client.getUrl(Uri.parse('https://api.github.com'));
            final response = await request.close();
            if (response.statusCode == 200) {
              'HTTPS Ping Success (GitHub)'.logSuccess();
              hasAccess = true;
            }
          } catch (e) {
            'HTTPS Ping Failed: $e'.logError('Connectivity');
          }
        }
        available = hasAccess;
      } catch (e) {
        'Unexpected connectivity error: $e'.logError('Connectivity');
        available = false;
      }
    } else {
      'No valid connectivity types found'.logWarning();
    }

    if (state.data != available) {
      'Switching Internet State to: $available'.logInfo('Connectivity');
      state = state.copyWith(data: available);
    }
  }

  Future<void> getCurrentConnectivityStatus() async {
    final data = await Connectivity().checkConnectivity();
    await isNetworkAvailable(data);
  }
}
