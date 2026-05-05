import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_state.dart';

class BoxFitDemoScreen extends StatelessWidget {
  const BoxFitDemoScreen({super.key});

  Widget _buildExample(
    BuildContext context,
    String title,
    BoxFit fit,
    String description,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.outline.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            'images/grupo.jpg',
            fit: fit,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.75)),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = context.read<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 4: BoxFit'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => appState.setScreen('exercicios'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Compare como a mesma imagem se comporta com diferentes BoxFit. Cada exemplo mostra o que muda no recorte e no espaço ocupado.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              _buildExample(
                context,
                'BoxFit.contain',
                BoxFit.contain,
                'A imagem é redimensionada para caber dentro do espaço, mantendo proporção. Pode deixar faixas vazias ao redor.',
              ),
              _buildExample(
                context,
                'BoxFit.cover',
                BoxFit.cover,
                'A imagem preenche todo o espaço, mantendo proporção, mas pode ser cortada nas bordas para preencher.',
              ),
              _buildExample(
                context,
                'BoxFit.fill',
                BoxFit.fill,
                'A imagem é esticada para ocupar todo o espaço, podendo distorcer a proporção original.',
              ),
              _buildExample(
                context,
                'BoxFit.fitWidth',
                BoxFit.fitWidth,
                'A largura da imagem se ajusta ao espaço; altura é escalada proporcionalmente, podendo deixar espaço vazio acima/abaixo.',
              ),
              const SizedBox(height: 20),
              Text(
                'Dica: altere o tamanho do container para ver ainda melhor como cada BoxFit se comporta.',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
