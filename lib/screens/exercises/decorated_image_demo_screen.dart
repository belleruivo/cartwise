import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_state.dart';

class DecoratedImageDemoScreen extends StatelessWidget {
  const DecoratedImageDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final appState = context.read<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 5: Imagem decorada'),
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
                'Aqui mostramos como usar uma imagem como fundo e sobrepor um texto no centro.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('images/grupo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black.withOpacity(0.35),
                    ),
                    child: Text(
                      'Bem-vindo ao meu App!',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Como funciona este código (explicando como se pediu):',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                '1) O Container usa BoxDecoration para colocar uma imagem de fundo (AssetImage).\n'
                '2) DecorationImage controla como a imagem é desenhada (aqui usamos BoxFit.cover para preencher).\n'
                '3) Para colocar texto por cima, usamos outro Container dentro do primeiro e aplicamos um fundo semitransparente (preto com opacidade).\n'
                '4) O texto é centralizado com Alignment.center e usado TextStyle para deixar legível em cima da imagem.',
                style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.75)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
