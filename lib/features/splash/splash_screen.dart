import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/constants/colors.dart';
import '../../utils/extensions/context_extensions.dart';
import '../authentication/providers/auth_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 600));
      final isLoggedIn = ref.read(authNotifierProvider.notifier).isLoggedIn;
      if (context.mounted) {
        context.go(isLoggedIn ? '/dashboard' : '/login');
      }
    });

    return Scaffold(
      backgroundColor: KColors.surface,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            const Icon(Icons.account_balance_wallet_rounded, size: 64, color: KColors.cash),
            Text(
              "Business Ledger",
              style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: KColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
