import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elyx_digital_task_app/presentation/users/components/user_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../domain/model/user.dart';
import '../../core/extension/context.dart';
import '../../core/extension/widget.dart';
import '../theme/app_color.dart';

@RoutePage()
class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      appBar: AppBar(
        title: const Text('User Profile'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(24),
            Center(
              child: Hero(
                tag: 'avatar_${user.id}',
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: AppColor.primary.withOpacity(0.05),
                  backgroundImage: CachedNetworkImageProvider(user.avatar),
                ).padAll(4).decorated(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColor.primary.withOpacity(0.1), width: 3),
                    ),
              ),
            ),
            const Gap(32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColor.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    spreadRadius: 1,
                    blurRadius: 20,
                    offset: const Offset(0, -10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          '${user.firstName} ${user.lastName}',
                          style: context.headlineStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColor.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(25),
                  Text(
                    'Information',
                    style: context.titleStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColor.textPrimary,
                    ),
                  ),
                  const Gap(20),
                  UserDetailCard(
                    icon: Icons.email_outlined,
                    label: 'Email Address',
                    value: '${user.firstName.toLowerCase()}@yopmail.com',
                  ),
                  const Gap(16),
                  UserDetailCard(
                    icon: Icons.perm_identity_outlined,
                    label: 'Account ID',
                    value: user.id.toString(),
                  ),
                  const Gap(200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
