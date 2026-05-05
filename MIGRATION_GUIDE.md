# Guia de Migração: Next.js/React → Flutter/Dart

## Visão Geral da Migração

Este documento descreve a migração completa do aplicativo Cartwise de Next.js/React para Flutter/Dart.

## Comparação de Tecnologias

| Aspecto | Next.js/React | Flutter/Dart |
|---------|---------------|--------------|
| **Linguagem** | TypeScript/JavaScript | Dart |
| **UI Framework** | React Components | Flutter Widgets |
| **Estado** | useState, Context | Provider, ChangeNotifier |
| **Navegação** | Conditional Rendering | Named Routes / Stack |
| **Estilo** | Tailwind CSS | Material Design 3 |
| **Ícones** | lucide-react | lucide_icons (Flutter) |

## Estrutura de Arquivos

### Antes (Next.js)
```
app/
components/
  cartwise/
  ui/
lib/
styles/
```

### Depois (Flutter)
```
lib/
  main.dart
  models/
  providers/
  screens/
    auth/
    home/
    purchase/
    history/
    analytics/
    group/
```

## Principais Mudanças

### 1. Componentes → Widgets

**React (antes):**
```tsx
export function HomeScreen({ onNewPurchase }: Props) {
  return (
    <div className="flex flex-col">
      <h1 className="text-xl">Home</h1>
    </div>
  );
}
```

**Flutter (depois):**
```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Home', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
```

### 2. Estado com useState → StatefulWidget + Provider

**React (antes):**
```tsx
const [count, setCount] = useState(0);
```

**Flutter (depois):**
```dart
// StatefulWidget
int count = 0;
setState(() => count++);

// Provider
class AppState extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners();
  }
}
```

### 3. Navegação

**React (antes):**
```tsx
const [screen, setScreen] = useState('login');
// Renderização condicional
if (screen === 'login') return <LoginScreen />;
```

**Flutter (depois):**
```dart
// Via Provider
appState.setScreen('login');

// No build
if (appState.currentScreen == 'login') {
  return LoginScreen();
}
```

### 4. Estilização

**Tailwind (antes):**
```tsx
<div className="bg-primary rounded-2xl p-5 mb-6">
```

**Flutter (depois):**
```dart
Container(
  padding: EdgeInsets.all(20),
  margin: EdgeInsets.only(bottom: 24),
  decoration: BoxDecoration(
    color: colorScheme.primary,
    borderRadius: BorderRadius.circular(16),
  ),
)
```

### 5. Formatação de Dados

**JavaScript (antes):**
```tsx
total.toFixed(2).replace(".", ",")
```

**Flutter (depois):**
```dart
import 'package:intl/intl.dart';

final formatter = NumberFormat.currency(
  locale: 'pt_BR', 
  symbol: 'R\$'
);
formatter.format(total)
```

## Componentes Migrados

### Telas de Autenticação
- ✅ LoginScreen
- ✅ RegisterScreen (integrada ao LoginScreen)

### Telas Principais
- ✅ HomeScreen
- ✅ NovaCompraScreen
- ✅ CompraAtivaScreen
- ✅ AdicionarItemScreen
- ✅ DetalheCompraScreen

### Telas de Navegação
- ✅ HistoricoScreen
- ✅ AnalisesScreen
- ✅ GrupoScreen

### Componentes de UI
- ✅ BottomNav (integrado ao CartwiseApp)
- ✅ Cards customizados
- ✅ Formulários e inputs

## Gerenciamento de Estado

### Provider Pattern
Utilizamos o padrão Provider do Flutter para gerenciamento de estado global:

```dart
class AppState extends ChangeNotifier {
  String _currentScreen = 'login';
  
  void setScreen(String screen) {
    _currentScreen = screen;
    notifyListeners(); // Notifica widgets ouvintes
  }
}
```

### Consumindo o Estado
```dart
// No widget
final appState = context.watch<AppState>();
appState.currentScreen; // Acessa o valor

// Para modificar
context.read<AppState>().setScreen('home');
```

## Desafios e Soluções

### 1. Tailwind → Material Design
- **Desafio**: Conversão de classes Tailwind para widgets Flutter
- **Solução**: Uso de `BoxDecoration`, `EdgeInsets`, e `BorderRadius`

### 2. Ícones Lucide
- **Desafio**: Manter os mesmos ícones
- **Solução**: Pacote `lucide_icons` para Flutter

### 3. Navegação Condicional
- **Desafio**: React usa renderização condicional simples
- **Solução**: IndexedStack para tabs + navegação condicional para telas

### 4. Formatação de Valores
- **Desafio**: Formatação PT-BR de moeda e datas
- **Solução**: Pacote `intl` com locale pt_BR

## Melhorias Implementadas

1. **Type Safety**: Dart oferece tipagem forte em tempo de compilação
2. **Performance**: Flutter compila para código nativo
3. **Hot Reload**: Desenvolvimento rápido mantido
4. **Material Design 3**: UI moderna e consistente
5. **Provider Pattern**: Gerenciamento de estado robusto

## Próximos Passos

- [ ] Adicionar testes unitários
- [ ] Implementar persistência local (SharedPreferences/SQLite)
- [ ] Integração com API backend
- [ ] Animações e transições
- [ ] Suporte a múltiplos idiomas (i18n)

## Recursos Úteis

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Provider Package](https://pub.dev/packages/provider)
- [Material Design 3](https://m3.material.io/)

---

**Tempo de Migração**: ~4-6 horas para projeto completo
**Complexidade**: Média
**Resultado**: ✅ Migração bem-sucedida com todas as funcionalidades preservadas
