import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_state.dart';

class ImageAssetDemoScreen extends StatelessWidget {
  const ImageAssetDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final appState = context.read<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 3: Image.asset'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => appState.setScreen('exercicios'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aqui a imagem é carregada de dentro do projeto usando Image.asset.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colorScheme.outline.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'images/grupo.jpg',
                    width: 280,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Dicas rápidas:',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                '''- A imagem precisa estar listada em pubspec.yaml sob `flutter.assets`.
- O caminho no Image.asset deve ser relativo à raiz do projeto (onde está o pubspec.yaml).
- Se você renomear a imagem, atualize tanto o arquivo quanto o pubspec.yaml.''',
                style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.75)),
              ),
              const Spacer(),
              Text(
                'Agora é sua vez: troque a imagem ou adicione novas para praticar.',
                style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
