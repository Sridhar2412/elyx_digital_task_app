import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../theme/app_color.dart';

class OfflineBottomBar extends StatelessWidget {
  final VoidCallback onRetry;

  const OfflineBottomBar({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: AppColor.textPrimary.withOpacity(0.95),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            const Icon(Icons.cloud_off_rounded,
                color: AppColor.white, size: 22),
            const Gap(12),
            const Expanded(
              child: Text(
                'Internet disconnected',
                style: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                ),
              ),
            ),
            TextButton(
              onPressed: onRetry,
              style: TextButton.styleFrom(
                backgroundColor: AppColor.primary,
                foregroundColor: AppColor.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Retry',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
