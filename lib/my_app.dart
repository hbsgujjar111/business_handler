import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

import 'utils/routes/app_routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToastificationWrapper(
      child: HeroIconTheme(
        style: HeroIconStyle.solid,
        child: MaterialApp.router(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
            child: Directionality(textDirection: TextDirection.ltr, child: child!),
          ),
          title: "KidStorey",
          routerConfig: appRoutes,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
