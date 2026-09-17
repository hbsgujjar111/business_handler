import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailCtrl = ref.watch(loginEmailControllerProvider);
    final passCtrl = ref.watch(loginPasswordControllerProvider);
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      backgroundColor: KColors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: KColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: KColors.border),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                const Icon(Icons.storefront_rounded, size: 48, color: KColors.primary),
                Text(
                  "Store Partner Login",
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                if (authState.hasError)
                  Text(
                    "Invalid login credentials",
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodySmall?.copyWith(color: KColors.expense),
                  ),
                TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    filled: true,
                    fillColor: KColors.surfaceSubtle,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
                TextField(
                  controller: passCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    filled: true,
                    fillColor: KColors.surfaceSubtle,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: authState.isLoading
                      ? null
                      : () async {
                          await ref
                              .read(authNotifierProvider.notifier)
                              .signIn(email: emailCtrl.text.trim(), password: passCtrl.text.trim());
                          if (ref.read(authNotifierProvider.notifier).isLoggedIn && context.mounted) {
                            context.go('/dashboard');
                          }
                        },
                  child: authState.isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text("Enter Dashboard"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
