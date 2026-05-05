# 📂 Estrutura Completa do Projeto Cartwise Flutter

## Árvore de Diretórios

```
flutter_cartwise/
│
├── 📄 .gitignore                           # Arquivos ignorados pelo Git
├── 📄 analysis_options.yaml                # Configurações do linter Dart
├── 📄 pubspec.yaml                         # Dependências e metadados do projeto
├── 📄 README.md                            # Documentação principal
├── 📄 QUICKSTART.md                        # Guia de início rápido
├── 📄 MIGRATION_GUIDE.md                   # Guia detalhado de migração
├── 📄 MIGRATION_SUMMARY.md                 # Resumo da migração
├── 📄 SETUP_GUIDE.md                       # Guia de configuração do Flutter
├── 📄 PROJECT_STRUCTURE.md                 # Este arquivo
│
└── lib/
    ├── 📄 main.dart                        # Ponto de entrada do aplicativo
    │
    ├── models/                             # Modelos de dados
    │   ├── 📄 purchase.dart                # Model de compra com dados mock
    │   └── 📄 cart_item.dart               # Model de item do carrinho
    │
    ├── providers/                          # Gerenciamento de estado
    │   └── 📄 app_state.dart               # Provider principal do app
    │
    └── screens/                            # Telas do aplicativo
        ├── 📄 cartwise_app.dart            # Widget principal com navegação
        │
        ├── auth/                           # Autenticação
        │   └── 📄 login_screen.dart        # Login + Registro
        │
        ├── home/                           # Tela inicial
        │   └── 📄 home_screen.dart         # Dashboard com resumo
        │
        ├── purchase/                       # Fluxo de compras
        │   ├── 📄 nova_compra_screen.dart      # Seleção de supermercado
        │   ├── 📄 compra_ativa_screen.dart     # Carrinho de compras ativo
        │   ├── 📄 adicionar_item_screen.dart   # Adicionar novo item
        │   └── 📄 detalhe_compra_screen.dart   # Detalhes da compra
        │
        ├── history/                        # Histórico
        │   └── 📄 historico_screen.dart    # Lista de compras anteriores
        │
        ├── analytics/                      # Análises
        │   └── 📄 analises_screen.dart     # Estatísticas e gráficos
        │
        └── group/                          # Grupos
            └── 📄 grupo_screen.dart        # Funcionalidade de grupos
```

## 📝 Descrição dos Arquivos

### Raiz do Projeto

#### `.gitignore`
- Arquivo de configuração do Git
- Define quais arquivos/pastas não devem ser versionados
- Inclui: build/, .dart_tool/, .packages, etc.

#### `analysis_options.yaml`
- Configurações do analisador estático do Dart
- Define regras de linting
- Ajuda a manter qualidade de código

#### `pubspec.yaml`
- Manifesto do projeto Flutter
- Lista todas as dependências
- Define metadados do app (nome, versão, etc.)
- Especifica assets e fontes

#### Arquivos de Documentação
- **README.md**: Documentação completa do projeto
- **QUICKSTART.md**: Como executar rapidamente
- **MIGRATION_GUIDE.md**: Comparação React → Flutter
- **MIGRATION_SUMMARY.md**: Resumo executivo da migração
- **SETUP_GUIDE.md**: Instalação e configuração do Flutter
- **PROJECT_STRUCTURE.md**: Este arquivo

### Diretório `lib/`

#### `main.dart`
```dart
// Ponto de entrada do aplicativo
// Define o tema, provider e widget raiz
void main() => runApp(MyApp());
```

**Responsabilidades:**
- Inicializar o app
- Configurar Provider
- Definir temas (light/dark)
- Configurar Google Fonts

### Diretório `lib/models/`

#### `purchase.dart`
```dart
// Model de compra
class Purchase {
  final int id;
  final String store;
  final double total;
  // ... outros campos
}
```

**Responsabilidades:**
- Definir estrutura de dados de compra
- Dados mock para demonstração
- Lista de compras recentes

#### `cart_item.dart`
```dart
// Model de item do carrinho
class CartItem {
  final int id;
  final String name;
  final double unitPrice;
  int quantity;
  // ... outros campos
}
```

**Responsabilidades:**
- Estrutura de item individual
- Cálculo de subtotal
- Gerenciamento de quantidade

### Diretório `lib/providers/`

#### `app_state.dart`
```dart
// Gerenciamento de estado global
class AppState extends ChangeNotifier {
  String _currentScreen = 'login';
  String _activeTab = 'home';
  // ... estado global
}
```

**Responsabilidades:**
- Controlar navegação entre telas
- Gerenciar tab ativa
- Armazenar dados de compra temporários
- Controlar tema (light/dark)
- Notificar widgets sobre mudanças

### Diretório `lib/screens/`

#### `cartwise_app.dart`
```dart
// Widget principal do app
class CartwiseApp extends StatelessWidget {
  // Gerencia navegação condicional
  // Renderiza tela atual baseado no estado
}
```

**Responsabilidades:**
- Navegação principal
- Renderização condicional de telas
- Bottom Navigation Bar
- IndexedStack para tabs

#### `auth/login_screen.dart`
```dart
// Autenticação de usuários
class LoginScreen extends StatefulWidget {
  // Login view
  // Register view
}
```

**Responsabilidades:**
- Formulário de login
- Formulário de registro
- Validação de campos
- Navegação pós-login

**Features:**
- Toggle mostrar/ocultar senha
- Troca entre login e registro
- Validação inline
- Design Material 3

#### `home/home_screen.dart`
```dart
// Tela principal do app
class HomeScreen extends StatelessWidget {
  // Dashboard
  // Resumo mensal
  // Compras recentes
}
```

**Responsabilidades:**
- Exibir resumo financeiro do mês
- Listar compras recentes
- Botões de ação rápida
- Navegação para nova compra

**Components:**
- Card de resumo mensal
- Botão CTA "Nova Compra"
- Quick actions (Histórico, Análises)
- Lista de compras recentes

#### `purchase/nova_compra_screen.dart`
```dart
// Iniciar nova compra
class NovaCompraScreen extends StatefulWidget {
  // Seleção de supermercado
  // Input personalizado
}
```

**Responsabilidades:**
- Campo de texto para nome da loja
- Lista de supermercados sugeridos
- Validação de seleção
- Navegação para compra ativa

**Features:**
- Sugestões de lojas recentes
- Seleção visual
- Info card com dica

#### `purchase/compra_ativa_screen.dart`
```dart
// Carrinho de compras ativo
class CompraAtivaScreen extends StatefulWidget {
  // Lista de itens
  // Controles de quantidade
  // Cálculo de total
}
```

**Responsabilidades:**
- Exibir lista de itens
- Controlar quantidade de cada item
- Calcular subtotal em tempo real
- Remover itens
- Finalizar compra

**Features:**
- Cards de item com categoria
- Botões +/- para quantidade
- Botão de remoção
- FAB para adicionar item
- Botão de finalização

#### `purchase/adicionar_item_screen.dart`
```dart
// Adicionar novo item ao carrinho
class AdicionarItemScreen extends StatefulWidget {
  // Formulário de item
  // Categorias
  // Cálculo de subtotal
}
```

**Responsabilidades:**
- Input de nome do produto
- Dropdown de categorias
- Stepper de quantidade
- Input de preço
- Cálculo automático de subtotal

**Features:**
- 12 categorias predefinidas
- Validação de campos
- Preview de subtotal
- Feedback ao adicionar

#### `purchase/detalhe_compra_screen.dart`
```dart
// Visualização detalhada de compra
class DetalheCompraScreen extends StatelessWidget {
  // Informações da compra
  // Lista completa de itens
}
```

**Responsabilidades:**
- Exibir informações da loja
- Mostrar data e hora
- Listar todos os itens
- Exibir total da compra

**Features:**
- Header com avatar da loja
- Card de resumo
- Lista de itens com categorias
- Formatação de valores

#### `history/historico_screen.dart`
```dart
// Histórico de compras
class HistoricoScreen extends StatefulWidget {
  // Lista de compras passadas
  // Filtros (futuro)
}
```

**Responsabilidades:**
- Listar todas as compras
- Exibir totais
- Navegação para detalhes
- Opções de filtro (UI preparada)

**Features:**
- Card de total gasto
- Lista ordenada por data
- Ícone de filtro
- Tap para detalhes

#### `analytics/analises_screen.dart`
```dart
// Análises e estatísticas
class AnalisesScreen extends StatelessWidget {
  // Gastos por categoria
  // Supermercados favoritos
  // Variação mensal
}
```

**Responsabilidades:**
- Exibir variação mensal
- Breakdown por categoria
- Top supermercados
- Estatísticas visuais

**Features:**
- Cards de resumo
- Progress bars por categoria
- Cards de lojas favoritas
- Design informativo

#### `group/grupo_screen.dart`
```dart
// Funcionalidade de grupos (em desenvolvimento)
class GrupoScreen extends StatelessWidget {
  // Empty state
  // CTAs para criar/entrar
}
```

**Responsabilidades:**
- Tela de boas-vindas
- Explicação da feature
- Botões de ação

**Features:**
- Empty state design
- Ícone ilustrativo
- 2 CTAs principais

## 📊 Estatísticas do Código

```
Total de arquivos Dart: 15
Total de telas: 11
Linhas de código: ~2,000+
Models: 2
Providers: 1
Screens: 11
```

## 🔗 Dependências entre Arquivos

```
main.dart
  └── cartwise_app.dart
      ├── app_state.dart (Provider)
      ├── login_screen.dart
      ├── home_screen.dart
      │   ├── purchase.dart (model)
      │   └── app_state.dart
      ├── nova_compra_screen.dart
      ├── compra_ativa_screen.dart
      │   └── cart_item.dart (model)
      ├── adicionar_item_screen.dart
      ├── detalhe_compra_screen.dart
      │   ├── purchase.dart
      │   └── cart_item.dart
      ├── historico_screen.dart
      │   └── purchase.dart
      ├── analises_screen.dart
      └── grupo_screen.dart
```

## 🎯 Fluxo de Navegação

```
Login
  ↓
Home (Tab Bar)
  ├── Home Tab
  │     ↓
  │   Nova Compra
  │     ↓
  │   Compra Ativa ←→ Adicionar Item
  │
  ├── Histórico Tab
  │     ↓
  │   Detalhe Compra
  │
  ├── Análises Tab
  │
  └── Grupo Tab
```

## 📦 Pacotes Externos Utilizados

```yaml
provider: ^6.1.1         # State management
google_fonts: ^6.1.0     # Typography
lucide_icons: ^0.3.0     # Icons
intl: ^0.19.0            # Internationalization
shared_preferences: ^2.2.2  # Local storage
```

## 🎨 Padrões de Design Utilizados

1. **Provider Pattern** - Gerenciamento de estado
2. **Repository Pattern** - Models separados
3. **Screen/Widget Separation** - Organização modular
4. **Composition over Inheritance** - Widgets compostos
5. **Single Responsibility** - Cada arquivo tem um propósito

## 🔮 Arquivos Futuros (Roadmap)

```
lib/
├── services/
│   ├── api_service.dart        # Comunicação HTTP
│   ├── auth_service.dart       # Autenticação
│   └── storage_service.dart    # SQLite/Hive
│
├── utils/
│   ├── constants.dart          # Constantes do app
│   ├── helpers.dart            # Funções auxiliares
│   └── validators.dart         # Validações
│
├── widgets/
│   ├── custom_button.dart      # Botões customizados
│   ├── loading_indicator.dart  # Indicadores de carga
│   └── empty_state.dart        # Estados vazios
│
└── tests/
    ├── widget_test.dart        # Testes de widgets
    ├── unit_test.dart          # Testes unitários
    └── integration_test.dart   # Testes de integração
```

---

**Última atualização:** 3 de março de 2026  
**Versão:** 1.0.0  
**Autor:** Migração React → Flutter
