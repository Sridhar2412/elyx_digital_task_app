import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/di/injector.dart';
import 'core/providers/shared_pref_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjector();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider
            .overrideWithValue(locate<SharedPreferences>()),
      ],
      child: const MyApp(),
    ),
  );
}
