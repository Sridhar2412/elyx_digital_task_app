import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/extension/context.dart';
import '../../../core/extension/widget.dart';
import '../../../domain/model/user.dart';
import '../../routes/app_router.dart';
import '../../theme/app_color.dart';

class UserTile extends ConsumerWidget {
  final User user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () => context.pushRoute(UserDetailRoute(user: user)),
      contentPadding: EdgeInsets.zero,
      leading: Hero(
        tag: 'avatar_${user.id}',
        child: CircleAvatar(
          radius: 28,
          backgroundColor: AppColor.primary.withOpacity(0.05),
          backgroundImage: CachedNetworkImageProvider(user.avatar),
        ).decorated(
          shape: BoxShape.circle,
          border:
              Border.all(color: AppColor.primary.withOpacity(0.1), width: 2),
        ),
      ),
      title: Text(
        '${user.firstName} ${user.lastName}',
        style: context.titleStyle.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColor.textPrimary,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(4),
          Text(
            '${user.firstName.toLowerCase()}@yopmail.com',
            style: context.bodyStyle.copyWith(color: AppColor.textSecondary),
          ),
        ],
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColor.primary,
        size: 20,
      ).padAll(8).decorated(
            color: AppColor.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
    ).marSym(hor: 16, ver: 8).decorated(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: AppColor.cardShadow,
        );
  }
}
