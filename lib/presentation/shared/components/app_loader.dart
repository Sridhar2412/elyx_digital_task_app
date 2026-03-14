import 'package:elyx_digital_task_app/core/extension/widget.dart';
import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColor.primary,
      strokeWidth: 3,
    ).padAll(16).center();
  }
}
