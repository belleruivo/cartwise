import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../providers/app_state.dart';
import 'auth/login_screen.dart';
import 'home/home_screen.dart';
import 'exercises/exercises_hub_screen.dart';
import 'alignment/alignment_demo_screen.dart';
import 'exercises/cross_axis_alignment_demo_screen.dart';
import 'exercises/image_asset_demo_screen.dart';
import 'exercises/box_fit_demo_screen.dart';
import 'exercises/decorated_image_demo_screen.dart';
import 'exercises/final_exercise_screen.dart';
import 'purchase/nova_compra_screen.dart';
import 'purchase/compra_ativa_screen.dart';
import 'purchase/adicionar_item_screen.dart';
import 'purchase/detalhe_compra_screen.dart';
import 'history/historico_screen.dart';
import 'analytics/analises_screen.dart';
import 'group/grupo_screen.dart';

class CartwiseApp extends StatelessWidget {
  const CartwiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    // Login screen
    if (appState.currentScreen == 'login') {
      return const LoginScreen();
    }

    // Nova compra screen
    if (appState.currentScreen == 'nova-compra') {
      return const NovaCompraScreen();
    }

    // Compra ativa screen
    if (appState.currentScreen == 'compra-ativa') {
      return const CompraAtivaScreen();
    }

    // Exercise hub
    if (appState.currentScreen == 'exercicios') {
      return const ExercisesHubScreen();
    }

    // Exercise screen (Alinhamento)
    if (appState.currentScreen == 'alignment-demo') {
      return const AlignmentDemoScreen();
    }

    // Exercise screen (CrossAxisAlignment)
    if (appState.currentScreen == 'cross-alignment-demo') {
      return const CrossAxisAlignmentDemoScreen();
    }

    // Exercise screen (Image.asset)
    if (appState.currentScreen == 'image-asset-demo') {
      return const ImageAssetDemoScreen();
    }

    // Exercise screen (BoxFit)
    if (appState.currentScreen == 'box-fit-demo') {
      return const BoxFitDemoScreen();
    }

    // Exercise screen (Imagem de fundo + texto)
    if (appState.currentScreen == 'decorated-image-demo') {
      return const DecoratedImageDemoScreen();
    }

    // Exercise screen (Exercício Final)
    if (appState.currentScreen == 'final-exercise') {
      return const FinalExerciseScreen();
    }

    // Adicionar item screen
    if (appState.currentScreen == 'adicionar-item') {
      return const AdicionarItemScreen();
    }

    // Detalhe compra screen
    if (appState.currentScreen == 'detalhe-compra' && appState.selectedPurchaseId != null) {
      return DetalheCompraScreen(purchaseId: appState.selectedPurchaseId!);
    }

    // Main app with bottom navigation
    return Scaffold(
      body: Stack(
        children: [
          // Content area
          IndexedStack(
            index: _getTabIndex(appState.activeTab),
            children: const [
              HomeScreen(),
              HistoricoScreen(),
              AnalisesScreen(),
              GrupoScreen(),
            ],
          ),
          // Bottom navigation
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _BottomNavBar(
              activeTab: appState.activeTab,
              onTabChanged: (tab) => appState.setActiveTab(tab),
            ),
          ),
        ],
      ),
    );
  }

  int _getTabIndex(String tab) {
    switch (tab) {
      case 'home':
        return 0;
      case 'historico':
        return 1;
      case 'analises':
        return 2;
      case 'grupo':
        return 3;
      default:
        return 0;
    }
  }
}

class _BottomNavBar extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChanged;

  const _BottomNavBar({
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: LucideIcons.home,
                label: 'Home',
                isActive: activeTab == 'home',
                onTap: () => onTabChanged('home'),
              ),
              _NavItem(
                icon: LucideIcons.clock,
                label: 'Histórico',
                isActive: activeTab == 'historico',
                onTap: () => onTabChanged('historico'),
              ),
              _NavItem(
                icon: LucideIcons.barChart2,
                label: 'Análises',
                isActive: activeTab == 'analises',
                onTap: () => onTabChanged('analises'),
              ),
              _NavItem(
                icon: LucideIcons.users,
                label: 'Grupo',
                isActive: activeTab == 'grupo',
                onTap: () => onTabChanged('grupo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: isActive ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.5),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: isActive ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
              if (isActive)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
