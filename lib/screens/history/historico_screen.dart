import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../providers/app_state.dart';
import '../../models/purchase.dart';

class HistoricoScreen extends StatefulWidget {
  const HistoricoScreen({super.key});

  @override
  State<HistoricoScreen> createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  String selectedMonth = 'Todos';
  String selectedStore = 'Todos';

  final List<String> months = ['Todos', 'Fevereiro 2026', 'Janeiro 2026'];
  final List<String> stores = ['Todos', 'Pão de Açúcar', 'Carrefour', 'Extra', 'Atacadão'];

  Color _getColorFromString(String colorName) {
    switch (colorName) {
      case 'orange': return Colors.orange.shade100;
      case 'blue': return Colors.blue.shade100;
      case 'red': return Colors.red.shade100;
      case 'purple': return Colors.purple.shade100;
      default: return Colors.grey.shade100;
    }
  }

  Color _getTextColorFromString(String colorName) {
    switch (colorName) {
      case 'orange': return Colors.orange.shade700;
      case 'blue': return Colors.blue.shade700;
      case 'red': return Colors.red.shade700;
      case 'purple': return Colors.purple.shade700;
      default: return Colors.grey.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final appState = context.watch<AppState>();
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    // Filter purchases
    final filtered = recentPurchases.where((p) {
      return true; // Simplified filtering for demo
    }).toList();

    final totalSpent = filtered.fold<double>(0, (sum, p) => sum + p.total);

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 56, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Histórico',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(LucideIcons.filter, size: 20),
                        onPressed: () {
                          // Show filter dialog
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [colorScheme.primary, colorScheme.primary.withOpacity(0.8)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total gasto',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onPrimary.withOpacity(0.7),
                              ),
                            ),
                            Text(
                              formatter.format(totalSpent),
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${filtered.length} compras',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimary.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Purchases list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final purchase = filtered[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () => appState.selectPurchase(purchase.id),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: colorScheme.outline.withOpacity(0.1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: _getColorFromString(purchase.color),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  purchase.initial,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    color: _getTextColorFromString(purchase.color),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    purchase.store,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${purchase.date} • ${purchase.items} itens',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onBackground.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  formatter.format(purchase.total),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  LucideIcons.chevronRight,
                                  size: 16,
                                  color: colorScheme.onBackground.withOpacity(0.4),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
