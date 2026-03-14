import 'package:elyx_digital_task_app/core/extension/context.dart';
import 'package:elyx_digital_task_app/core/extension/widget.dart';
import 'package:elyx_digital_task_app/presentation/theme/app_color.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class UserDetailCard extends ConsumerStatefulWidget {
  const UserDetailCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});
  final IconData icon;
  final String label;
  final String value;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserDetailCardState();
}

class _UserDetailCardState extends ConsumerState<UserDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.scaffoldBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.greyLight.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Icon(widget.icon, color: AppColor.primary, size: 24)
              .padAll(10)
              .decorated(
                color: AppColor.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: context.bodyStyle.copyWith(
                    color: AppColor.textSecondary,
                    fontSize: 12,
                  ),
                ),
                const Gap(4),
                Text(
                  widget.value,
                  style: context.titleStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
