import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/services/local_storage_service.dart';

final loginEmailControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
});

final loginPasswordControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AsyncValue<void>>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AsyncValue<void>> {
  AuthNotifier() : super(const AsyncData(null));

  final _supabase = Supabase.instance.client;

  bool get isLoggedIn => _supabase.auth.currentSession != null;

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncLoading();
    try {
      await _supabase.auth.signInWithPassword(email: email, password: password);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> signOut() async {
    await StorageService.clear();
    await _supabase.auth.signOut();
  }
}
