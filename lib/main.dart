// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'my_app.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Set edge-to-edge mode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  /// Storage
  await GetStorage.init();

  /// supabase init
  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabasePublishableKey = String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY');

  if (supabaseUrl.isEmpty || supabasePublishableKey.isEmpty) {
    throw Exception('Missing Supabase credentials. Pass via --dart-define-from-file=.env.json');
  }

  await Supabase.initialize(url: supabaseUrl, publishableKey: supabasePublishableKey);

  /// run app
  runApp(ProviderScope(child: const MyApp()));

  /// splash remove
  FlutterNativeSplash.remove();
}
