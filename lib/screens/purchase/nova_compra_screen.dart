import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../providers/app_state.dart';

class NovaCompraScreen extends StatefulWidget {
  const NovaCompraScreen({super.key});

  @override
  State<NovaCompraScreen> createState() => _NovaCompraScreenState();
}

class _NovaCompraScreenState extends State<NovaCompraScreen> {
  final _storeController = TextEditingController();
  String _selectedStore = '';

  final List<Map<String, dynamic>> suggestedStores = [
    {'name': 'Pão de Açúcar', 'initial': 'P', 'colorName': 'orange'},
    {'name': 'Carrefour', 'initial': 'C', 'colorName': 'blue'},
    {'name': 'Extra', 'initial': 'E', 'colorName': 'red'},
    {'name': 'Atacadão', 'initial': 'A', 'colorName': 'purple'},
    {'name': 'Mercadão', 'initial': 'M', 'colorName': 'green'},
  ];

  Color _getColorFromName(String colorName) {
    switch (colorName) {
      case 'orange': return Colors.orange.shade100;
      case 'blue': return Colors.blue.shade100;
      case 'red': return Colors.red.shade100;
      case 'purple': return Colors.purple.shade100;
      case 'green': return Colors.green.shade100;
      default: return Colors.grey.shade100;
    }
  }

  Color _getTextColorFromName(String colorName) {
    switch (colorName) {
      case 'orange': return Colors.orange.shade700;
      case 'blue': return Colors.blue.shade700;
      case 'red': return Colors.red.shade700;
      case 'purple': return Colors.purple.shade700;
      case 'green': return Colors.green.shade700;
      default: return Colors.grey.shade700;
    }
  }

  @override
  void dispose() {
    _storeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final appState = context.watch<AppState>();

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 56, 20, 24),
              child: Row(
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
                  Text(
                    'Nova Compra',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Store name input
                    Text(
                      'Onde você vai comprar?',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _storeController,
                      onChanged: (value) => setState(() => _selectedStore = value),
                      decoration: InputDecoration(
                        hintText: 'Nome do supermercado',
                        prefixIcon: const Icon(LucideIcons.mapPin, size: 18),
                        filled: true,
                        fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.2)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: colorScheme.primary, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Suggested stores
                    Text(
                      'SUPERMERCADOS RECENTES',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onBackground.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...suggestedStores.map((store) {
                      final isSelected = _selectedStore == store['name'];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedStore = store['name'];
                              _storeController.text = store['name'];
                            });
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isSelected ? colorScheme.secondaryContainer : colorScheme.surface,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? colorScheme.primary
                                    : colorScheme.outline.withOpacity(0.2),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: _getColorFromName(store['colorName']),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      store['initial'],
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        color: _getTextColorFromName(store['colorName']),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    store['name'],
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: colorScheme.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color: colorScheme.onPrimary,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 32),

                    // Info card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: colorScheme.outline.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            LucideIcons.info,
                            size: 16,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onBackground.withOpacity(0.7),
                                  height: 1.5,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Dica: ',
                                    style: TextStyle(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Você pode adicionar itens à sua lista durante a compra. O total é atualizado em tempo real.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Start button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _selectedStore.trim().isEmpty
                      ? null
                      : () => appState.startPurchase(_selectedStore),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Iniciar compra',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        LucideIcons.chevronRight,
                        size: 18,
                        color: colorScheme.onPrimary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
