import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_super_app/core/router/route_names.dart';

class DashboardShell extends StatelessWidget {
  const DashboardShell({required this.child, super.key});
  final Widget child;

  int _getCurrentIndex(BuildContext context) {
    final route = GoRouterState.of(context).matchedLocation;
    if (route.startsWith(RouteNames.aiAssistant)) return 1;
    if (route.startsWith(RouteNames.websocketSystem)) return 2;
    if (route.startsWith(RouteNames.cashierApps)) return 3;
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
              context.go(RouteNames.dashboard);
            case 1:
              context.go(RouteNames.aiAssistant);
            case 2:
              context.go(RouteNames.websocketSystem);
            case 3:
              context.go(RouteNames.cashierApps);
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
          BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale_rounded),
            label: 'Cashier',
          ),
        ],
      ),
    );
  }
}
