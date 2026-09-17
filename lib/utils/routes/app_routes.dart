import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../error_screen.dart';
import '../../features/authentication/login/login.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/splash/splash_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter appRoutes = GoRouter(
  navigatorKey: rootNavigatorKey,
  errorBuilder: (context, state) => ErrorScreen(error: state.error?.message),
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/dashboard', builder: (context, state) => const DashboardScreen()),
  ],
);
