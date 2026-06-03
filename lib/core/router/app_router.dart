import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_super_app/core/router/dashboard_shell.dart';
import 'package:portfolio_super_app/core/router/route_paths.dart';
import 'package:portfolio_super_app/features/cashier/cashier.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RoutePaths.root,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RoutePaths.root,
      builder: (context, state) => const DashboardHomePage(),
    ),
    GoRoute(
      path: RoutePaths.cashier,
      builder: (context, state) => const CashierPage(),
    ),
  ],
);
