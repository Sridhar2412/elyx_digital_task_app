import 'package:auto_route/auto_route.dart';
import 'package:elyx_digital_task_app/domain/model/user.dart';
import 'package:elyx_digital_task_app/presentation/users/user_detail_page.dart';
import 'package:elyx_digital_task_app/presentation/users/users_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: UsersRoute.page, initial: true),
        AutoRoute(page: UserDetailRoute.page),
      ];
}
