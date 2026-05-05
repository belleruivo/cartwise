import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_state.dart';

enum _AlignmentOption {
  start,
  center,
  end,
  spaceAround,
  spaceBetween,
  spaceEvenly,
}

extension on _AlignmentOption {
  String get label {
    switch (this) {
      case _AlignmentOption.start:
        return 'Start';
      case _AlignmentOption.center:
        return 'Center';
      case _AlignmentOption.end:
        return 'End';
      case _AlignmentOption.spaceAround:
        return 'Space Around';
      case _AlignmentOption.spaceBetween:
        return 'Space Between';
      case _AlignmentOption.spaceEvenly:
        return 'Space Evenly';
    }
  }

  MainAxisAlignment get alignment {
    switch (this) {
      case _AlignmentOption.start:
        return MainAxisAlignment.start;
      case _AlignmentOption.center:
        return MainAxisAlignment.center;
      case _AlignmentOption.end:
        return MainAxisAlignment.end;
      case _AlignmentOption.spaceAround:
        return MainAxisAlignment.spaceAround;
      case _AlignmentOption.spaceBetween:
        return MainAxisAlignment.spaceBetween;
      case _AlignmentOption.spaceEvenly:
        return MainAxisAlignment.spaceEvenly;
    }
  }

  String get description {
    switch (this) {
      case _AlignmentOption.start:
        return 'Alinha os itens no início do eixo principal (à esquerda em um Row).';
      case _AlignmentOption.center:
        return 'Centraliza os itens no eixo principal.';
      case _AlignmentOption.end:
        return 'Alinha os itens no fim do eixo principal (à direita em um Row).';
      case _AlignmentOption.spaceAround:
        return 'Espaço igual ao redor de cada item. Os itens têm espaçamento metade na borda externa.';
      case _AlignmentOption.spaceBetween:
        return 'Espaço igual entre os itens; sem espaço antes do primeiro e depois do último.';
      case _AlignmentOption.spaceEvenly:
        return 'Espaço igual entre os itens e também antes do primeiro e depois do último.';
    }
  }
}

class AlignmentDemoScreen extends StatefulWidget {
  const AlignmentDemoScreen({super.key});

  @override
  State<AlignmentDemoScreen> createState() => _AlignmentDemoScreenState();
}

class _AlignmentDemoScreenState extends State<AlignmentDemoScreen> {
  _AlignmentOption _selected = _AlignmentOption.start;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final appState = context.read<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 1: Alinhamento'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => appState.setActiveTab('home'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Escolha um alinhamento para ver como os itens se comportam no eixo principal:',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<_AlignmentOption>(
                initialValue: _selected,
                decoration: InputDecoration(
                  labelText: 'MainAxisAlignment',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                items: _AlignmentOption.values
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
                'Linha de exemplo:',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Container(
                height: 120,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: _selected.alignment,
                  children: const [
                    _LetterBox(letter: 'A'),
                    _LetterBox(letter: 'B'),
                    _LetterBox(letter: 'C'),
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
                style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.8)),
              ),
              const Spacer(),
              Text(
                'Dica: Observe a posição dos textos A, B e C na linha e como o espaçamento muda quando você alterna o alinhamento.',
                style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LetterBox extends StatelessWidget {
  final String letter;

  const _LetterBox({required this.letter});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        letter,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
