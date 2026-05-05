import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_state.dart';



enum _CrossAlignmentOption {
  start,
  center,
  end,
  stretch,
}

extension on _CrossAlignmentOption {
  String get label {
    switch (this) {
      case _CrossAlignmentOption.start:
        return 'Start';
      case _CrossAlignmentOption.center:
        return 'Center';
      case _CrossAlignmentOption.end:
        return 'End';
      case _CrossAlignmentOption.stretch:
        return 'Stretch';
    }
  }

  CrossAxisAlignment get alignment {
    switch (this) {
      case _CrossAlignmentOption.start:
        return CrossAxisAlignment.start;
      case _CrossAlignmentOption.center:
        return CrossAxisAlignment.center;
      case _CrossAlignmentOption.end:
        return CrossAxisAlignment.end;
      case _CrossAlignmentOption.stretch:
        return CrossAxisAlignment.stretch;
    }
  }

  String get description {
    switch (this) {
      case _CrossAlignmentOption.start:
        return 'Os textos começam no lado esquerdo (início) da coluna. Cada linha alinha-se no mesmo ponto de partida.';
      case _CrossAlignmentOption.center:
        return 'Os textos ficam centralizados horizontalmente dentro do espaço disponível.';
      case _CrossAlignmentOption.end:
        return 'Os textos são alinhados ao lado direito (fim) da coluna.';
      case _CrossAlignmentOption.stretch:
        return 'Os textos ocupam toda a largura disponível (esticam), assim como seus contêineres. Isso é útil quando queremos que os itens tenham a mesma largura.';
    }
  }
}

class CrossAxisAlignmentDemoScreen extends StatefulWidget {
  const CrossAxisAlignmentDemoScreen({super.key});

  @override
  State<CrossAxisAlignmentDemoScreen> createState() => _CrossAxisAlignmentDemoScreenState();
}

class _CrossAxisAlignmentDemoScreenState extends State<CrossAxisAlignmentDemoScreen> {
  _CrossAlignmentOption _selected = _CrossAlignmentOption.start;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final appState = context.read<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 2: CrossAxisAlignment'),
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
                'Escolha um crossAxisAlignment para ver como a coluna posiciona os itens horizontalmente:',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<_CrossAlignmentOption>(
                initialValue: _selected,
                decoration: InputDecoration(
                  labelText: 'CrossAxisAlignment',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                items: _CrossAlignmentOption.values
                    .map(
                      (option) => DropdownMenuItem(
                        value: option,
                        child: Text(option.label),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => _selected = value);
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Coluna de exemplo:',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: _selected.alignment,
                  children: [
                    Container(
                      width: 120,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: colorScheme.primaryContainer.withOpacity(0.4),
                      child: Text(
                        'Texto pequeno (16)',
                        style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: colorScheme.primaryContainer.withOpacity(0.3),
                      child: Text(
                        'Texto médio (24)',
                        style: theme.textTheme.bodyMedium?.copyWith(fontSize: 24),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 260,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: colorScheme.primaryContainer.withOpacity(0.2),
                      child: Text(
                        'Texto grande (32)',
                        style: theme.textTheme.bodyMedium?.copyWith(fontSize: 32),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'O que acontece:',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                _selected.description,
                style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface.withOpacity(0.75)),
              ),              
              const Spacer(),
              Text(
                'Dica: perceba como o mesmo conteúdo se comporta quando você muda o alinhamento transversal da coluna.',
                style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
