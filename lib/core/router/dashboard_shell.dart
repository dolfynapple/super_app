import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_super_app/core/router/route_paths.dart';

class DashboardHomePage extends StatelessWidget {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio Dashboard'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Choose an app',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Cashier is the only active module right now. The others stay visible as planned extensions, but they are intentionally not open yet.',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.05,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _AppMenuCard(
                  title: 'Cashier',
                  description:
                      'Open the POS workspace and continue the first implementation slice.',
                  icon: Icons.point_of_sale_rounded,
                  accentColor: theme.colorScheme.primary,
                  actionLabel: 'Open app',
                  onTap: () => context.push(RoutePaths.cashier),
                ),
                const _AppMenuCard(
                  title: 'AI Assistant',
                  description:
                      'Planned for a later portfolio slice after cashier is stable.',
                  icon: Icons.psychology_rounded,
                  statusLabel: 'Deferred',
                ),
                const _AppMenuCard(
                  title: 'Websocket System',
                  description:
                      'Reserved for realtime experiments once the cashier workflow is established.',
                  icon: Icons.sync_alt_rounded,
                  statusLabel: 'Deferred',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AppMenuCard extends StatelessWidget {
  const _AppMenuCard({
    required this.title,
    required this.description,
    required this.icon,
    this.actionLabel,
    this.statusLabel,
    this.onTap,
    this.accentColor,
  });

  final String title;
  final String description;
  final IconData icon;
  final String? actionLabel;
  final String? statusLabel;
  final VoidCallback? onTap;
  final Color? accentColor;

  bool get isEnabled => onTap != null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final cardColor = isEnabled
        ? (accentColor ?? colors.primary).withValues(alpha: 0.12)
        : colors.surfaceContainerHighest;
    final iconColor = isEnabled
        ? accentColor ?? colors.primary
        : colors.outline;

    return Card(
      clipBehavior: Clip.antiAlias,
      color: cardColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 32, color: iconColor),
              const Spacer(),
              Text(title, style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                description,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              if (isEnabled)
                FilledButton(
                  onPressed: onTap,
                  child: Text(actionLabel ?? 'Open'),
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    statusLabel ?? 'Unavailable',
                    style: theme.textTheme.labelLarge,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
