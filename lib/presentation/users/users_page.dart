import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../core/extension/widget.dart';
import '../shared/components/app_loader.dart';
import '../theme/app_color.dart';
import 'components/user_shimmer_tile.dart';
import 'components/user_tile.dart';
import 'providers/users_notifier.dart';

@RoutePage()
class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  @override
  ConsumerState<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<UsersPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(usersNotifierProvider.notifier).getUsersList();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(usersNotifierProvider.select((s) => s.error), (previous, error) {
      if (error.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColor.error,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
        ref.read(usersNotifierProvider.notifier).resetError();
      }
    });

    final state = ref.watch(usersNotifierProvider);
    final notifier = ref.read(usersNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Users'),
        actions: const [],
      ),
      body: Column(
        children: [
          TextField(
            controller: notifier.searchCtrl,
            decoration: InputDecoration(
              hintText: 'Search by name...',
              prefixIcon: const Icon(Icons.search, color: AppColor.primary),
              filled: true,
              fillColor: AppColor.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(color: AppColor.greyLight.withOpacity(0.5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(color: AppColor.primary, width: 1.5),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ).padSym(hor: 16, ver: 12),
          Expanded(
            child: (state.loading && state.data.isEmpty)
                ? const UserShimmerList()
                : state.data.isEmpty && !state.loading
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_search_outlined,
                                size: 80, color: AppColor.greyLight),
                            Gap(16),
                            Text(
                              'No users found',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        color: AppColor.primary,
                        onRefresh: () async =>
                            await notifier.getUsersList(refresh: true),
                        child: ListView.builder(
                          itemCount: state.data.length,
                          padding: const EdgeInsets.only(bottom: 24, top: 8),
                          itemBuilder: (context, index) {
                            if (index == state.data.length - 1) {
                              if (state.loadMore) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) async {
                                  await notifier.loadMore();
                                });
                                return const AppLoader();
                              }
                              return const SizedBox.shrink();
                            }

                            final user = state.data[index];
                            return UserTile(user: user).padSym(hor: 16, ver: 8);
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
