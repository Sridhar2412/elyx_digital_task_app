import 'package:elyx_digital_task_app/core/extension/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/internet_connectivity_provider.dart';
import '../users/providers/users_notifier.dart';
import 'components/offline_bottom_bar.dart';

class InternetStateWrapper extends ConsumerStatefulWidget {
  const InternetStateWrapper({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<InternetStateWrapper> createState() =>
      _InternetStateWrapperState();
}

class _InternetStateWrapperState extends ConsumerState<InternetStateWrapper> {
  @override
  Widget build(BuildContext context) {
    final internetState = ref.watch(internetConnectionStateProvider);

    return Stack(
      children: [
        widget.child,
        if (!internetState.data)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: OfflineBottomBar(
              onRetry: () {
                ref
                    .read(usersNotifierProvider.notifier)
                    .getUsersList(refresh: true);
              },
            ).padAll(0),
          ),
      ],
    );
  }
}
