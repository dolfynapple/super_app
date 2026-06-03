// Ignore for testing purposes
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_super_app/app/app.dart';
import 'package:portfolio_super_app/core/router/dashboard_shell.dart';

void main() {
  group('App', () {
    testWidgets('renders DashboardHomePage', (tester) async {
      await tester.pumpWidget(App());
      await tester.pumpAndSettle();
      expect(find.byType(DashboardHomePage), findsOneWidget);
      expect(find.text('Cashier'), findsOneWidget);
    });
  });
}
