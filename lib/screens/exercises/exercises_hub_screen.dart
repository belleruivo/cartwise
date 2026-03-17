import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_state.dart';

class ExercisesHubScreen extends StatelessWidget {
  const ExercisesHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = context.read<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Central de Exercícios'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => appState.setActiveTab('home'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aqui você encontra todos os exercícios que estão sendo pedidos na matéria. Escolha um para ver o enunciado e testar a solução.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              _ExerciseCard(
                number: 1,
                title: 'Alinhamento no eixo principal',
                description: 'Explore as opções de MainAxisAlignment em um Row com A, B e C.',
                onTap: () => appState.setScreen('alignment-demo'),
              ),
              const SizedBox(height: 12),
              _ExerciseCard(
                number: 2,
                title: 'Alinhamento transversal',
                description: 'Teste CrossAxisAlignment em uma coluna com textos de tamanhos diferentes.',
                onTap: () => appState.setScreen('cross-alignment-demo'),
              ),
              const SizedBox(height: 12),
              _ExerciseCard(
                number: 3,
                title: 'Image.asset',
                description: 'Mostra uma imagem local do projeto usando Image.asset.',
                onTap: () => appState.setScreen('image-asset-demo'),
              ),
              const SizedBox(height: 12),
              _ExerciseCard(
                number: 4,
                title: 'BoxFit (ajuste de imagem)',
                description: 'Compare como a mesma imagem se comporta com diferentes BoxFit.',
                onTap: () => appState.setScreen('box-fit-demo'),
              ),
              const SizedBox(height: 12),
              _ExerciseCard(
                number: 5,
                title: 'Imagem de fundo + texto',
                description: 'Coloca uma imagem de fundo com texto centralizado por cima.',
                onTap: () => appState.setScreen('decorated-image-demo'),
              ),
              const SizedBox(height: 12),
              _ExerciseCard(
                number: 6,
                title: 'Final: imagem + texto + botão',
                description: 'Combina alinhamento, imagem e ação de botão em uma única tela.',
                onTap: () => appState.setScreen('final-exercise'),
              ),
              const SizedBox(height: 12),
              // Caso queira adicionar mais exercícios, inclua novos _ExerciseCard aqui.
            ],
          ),
        ),
      ),
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _ExerciseCard({
    required this.number,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: colorScheme.outline.withOpacity(0.12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      number.toString(),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.7)),
            ),
          ],
        ),
      ),
    );
  }
}
