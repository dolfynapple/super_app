// lib/app/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_super_app/core/router/dashboard_shell.dart';
import 'package:portfolio_super_app/core/router/route_paths.dart';
import 'package:portfolio_super_app/features/counter/counter.dart'; // Using the default template page as a placeholder

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics:
      true, // Automatically prints route changes to your debug console
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return DashboardShell(child: child);
      },
      routes: [
        GoRoute(
          path: RoutePaths.dashboard,
          builder: (context, state) => const Center(
            child: Text(
              '🎛️ Central Hub Dashboard\n(Welcome back, Fyn!)',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        GoRoute(
          path: RoutePaths.aiAssistant,
          builder: (context, state) =>
              const Center(child: Text('🤖 AI Assistant Mini-App')),
        ),
        GoRoute(
          path: RoutePaths.websocketSystem,
          builder: (context, state) =>
              const CounterPage(), // Temporary placeholder using your Very Good template feature
        ),
        GoRoute(
          path: RoutePaths.cashierApps,
          builder: (context, state) => const Center(
            child: Text('💳 Cashier Apps Mini-App'),
          ), // Temporary placeholder using your Very Good template feature
        ),
      ],
    ),
  ],
);
