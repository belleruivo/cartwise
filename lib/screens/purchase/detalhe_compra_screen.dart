import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../providers/app_state.dart';
import '../../models/purchase.dart';
import '../../models/cart_item.dart';

class DetalheCompraScreen extends StatelessWidget {
  final int purchaseId;

  const DetalheCompraScreen({
    super.key,
    required this.purchaseId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final appState = context.watch<AppState>();
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    // Find the purchase
    final purchase = recentPurchases.firstWhere(
      (p) => p.id == purchaseId,
      orElse: () => recentPurchases.first,
    );

    // Mock items for this purchase
    final items = [
      CartItem(id: 1, name: 'Leite Integral', category: 'Laticínios', quantity: 2, unitPrice: 5.49),
      CartItem(id: 2, name: 'Arroz Branco 5kg', category: 'Grãos', quantity: 1, unitPrice: 24.90),
      CartItem(id: 3, name: 'Feijão Carioca', category: 'Grãos', quantity: 2, unitPrice: 8.75),
      CartItem(id: 4, name: 'Frango Inteiro', category: 'Carnes', quantity: 1, unitPrice: 32.99),
      CartItem(id: 5, name: 'Azeite Extra Virgem', category: 'Condimentos', quantity: 1, unitPrice: 19.90),
    ];

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(20, 56, 20, 24),
              decoration: BoxDecoration(
                color: colorScheme.background,
                border: Border(
                  bottom: BorderSide(
                    color: colorScheme.outline.withOpacity(0.1),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceVariant.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(LucideIcons.arrowLeft, size: 20),
                          onPressed: () => appState.setScreen('main'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Detalhes da compra',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: _getColorFromString(purchase.color),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            purchase.initial,
                            style: theme.textTheme.headlineSmall?.copyWith(
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
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              purchase.date,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onBackground.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                              'Total',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onPrimary.withOpacity(0.7),
                              ),
                            ),
                            Text(
                              formatter.format(purchase.total),
                              style: theme.textTheme.headlineSmall?.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${purchase.items} itens',
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

            // Items list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: colorScheme.surfaceVariant.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    item.category,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onBackground.withOpacity(0.6),
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${item.quantity}x ${formatter.format(item.unitPrice)}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onBackground.withOpacity(0.6),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                formatter.format(item.total),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
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

  Color _getColorFromString(String colorName) {
    switch (colorName) {
      case 'orange':
        return Colors.orange.shade100;
      case 'blue':
        return Colors.blue.shade100;
      case 'red':
        return Colors.red.shade100;
      case 'purple':
        return Colors.purple.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _getTextColorFromString(String colorName) {
    switch (colorName) {
      case 'orange':
        return Colors.orange.shade700;
      case 'blue':
        return Colors.blue.shade700;
      case 'red':
        return Colors.red.shade700;
      case 'purple':
        return Colors.purple.shade700;
      default:
        return Colors.grey.shade700;
    }
  }
}
