import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/routes/app_router.dart';
import 'presentation/shared/internet_state_wrapper.dart';
import 'presentation/theme/app_color.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Elyx Digital Task App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primary,
          primary: AppColor.primary,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.scaffoldBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.surface,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.textPrimary),
          titleTextStyle: TextStyle(
            color: AppColor.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardTheme(
          color: AppColor.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColor.greyLight.withOpacity(0.5)),
          ),
        ),
      ),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return InternetStateWrapper(
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child!,
          ),
        );
      },
    );
  }
}
