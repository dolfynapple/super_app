import 'package:flutter/material.dart';

class CashierView extends StatelessWidget {
  const CashierView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cashier Workspace'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'Portfolio Super App',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'The active module is the cashier app. AI assistant and websocket work are intentionally deferred until the cashier flow is stable.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          const _ContextCard(
            title: 'Current focus',
            description:
                'Build the cashier domain first: catalog, cart, checkout, transaction history, and local-first persistence.',
            icon: Icons.point_of_sale_rounded,
          ),
          const SizedBox(height: 16),
          const _ContextCard(
            title: 'Deferred modules',
            description:
                'AI assistant and websocket features stay out of the main navigation and should not shape current architectural decisions.',
            icon: Icons.pause_circle_outline_rounded,
          ),
          const SizedBox(height: 16),
          const _ContextCard(
            title: 'Next implementation slices',
            description:
                'Start with product list, cart state, checkout summary, and a repository contract backed by local storage.',
            icon: Icons.checklist_rounded,
          ),
        ],
      ),
    );
  }
}

class _ContextCard extends StatelessWidget {
  const _ContextCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
