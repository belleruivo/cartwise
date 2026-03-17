import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_state.dart';

class FinalExerciseScreen extends StatelessWidget {
  const FinalExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = context.read<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício Final'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => appState.setScreen('exercicios'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'images/grupo.jpg',
                    width: 280,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Essa tela junta alinhamento e imagens para criar uma interface simples e bonita. Aqui a imagem está centralizada e o texto descreve o que você está vendo.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Isso aparece no console quando o botão é clicado.
                    debugPrint('Você clicou no botão!');
                  },
                  child: const Text('Clique aqui'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
