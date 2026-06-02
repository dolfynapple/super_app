// lib/app/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_super_app/counter/counter.dart'; // Using the default template page as a placeholder

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
          path: '/',
          builder: (context, state) => const Center(
            child: Text(
              '🎛️ Central Hub Dashboard\n(Welcome back, Fyn!)',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        GoRoute(
          path: '/ai-assistant',
          builder: (context, state) =>
              const Center(child: Text('🤖 AI Assistant Mini-App')),
        ),
        GoRoute(
          path: '/websocket-system',
          builder: (context, state) =>
              const CounterPage(), // Temporary placeholder using your Very Good template feature
        ),
      ],
    ),
  ],
);

class DashboardShell extends StatelessWidget {
  const DashboardShell({required this.child, super.key});
  final Widget child;

  int _getCurrentIndex(BuildContext context) {
    final route = GoRouterState.of(context).matchedLocation;
    if (route.startsWith('/ai-assistant')) return 1;
    if (route.startsWith('/websocket-system')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getCurrentIndex(context),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
            case 1:
              context.go('/ai-assistant');
            case 2:
              context.go('/websocket-system');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'Hub',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.psychology_rounded),
            label: 'AI Agent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync_alt_rounded),
            label: 'Streams',
          ),
        ],
      ),
    );
  }
}
