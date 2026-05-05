# Cartwise - Gestão Inteligente de Compras

Aplicativo Flutter para gestão inteligente de compras de supermercado, permitindo aos usuários rastrear gastos, organizar listas de compras e analisar padrões de consumo.

## 🚀 Características

- ✅ **Autenticação**: Login e registro de usuários
- 🛒 **Compras Ativas**: Adicione itens em tempo real durante suas compras
- 📊 **Análises**: Visualize gastos por categoria e supermercado
- 📜 **Histórico**: Acompanhe todas as compras anteriores
- 👥 **Grupos**: Compartilhe listas com familiares (em desenvolvimento)
- 🎨 **Tema Dark/Light**: Suporte a temas claro e escuro
- 📱 **Design Moderno**: Interface limpa e intuitiva

## 📋 Pré-requisitos

- Flutter SDK 3.0.0 ou superior
- Dart SDK 3.0.0 ou superior
- Android Studio / VS Code com extensões Flutter
- Dispositivo Android/iOS ou Emulador

## 🔧 Instalação

1. Clone o repositório:
```bash
git clone <repository-url>
cd flutter_cartwise
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o aplicativo:
```bash
flutter run
```

## 📦 Dependências Principais

- `provider`: Gerenciamento de estado
- `google_fonts`: Tipografia customizada
- `lucide_icons`: Ícones modernos
- `intl`: Formatação de datas e moedas
- `shared_preferences`: Armazenamento local

## 🏗️ Estrutura do Projeto

```
lib/
├── main.dart                 # Ponto de entrada do app
├── models/                   # Modelos de dados
│   ├── purchase.dart
│   └── cart_item.dart
├── providers/                # Gerenciamento de estado
│   └── app_state.dart
└── screens/                  # Telas do aplicativo
    ├── cartwise_app.dart     # App principal com navegação
    ├── auth/                 # Autenticação
    │   └── login_screen.dart
    ├── home/                 # Tela inicial
    │   └── home_screen.dart
    ├── purchase/             # Fluxo de compras
    │   ├── nova_compra_screen.dart
    │   ├── compra_ativa_screen.dart
    │   ├── adicionar_item_screen.dart
    │   └── detalhe_compra_screen.dart
    ├── history/              # Histórico
    │   └── historico_screen.dart
    ├── analytics/            # Análises
    │   └── analises_screen.dart
    └── group/                # Grupos
        └── grupo_screen.dart
```

## 🎨 Temas

O aplicativo suporta temas claro e escuro automáticos, utilizando Material Design 3 com uma paleta de cores baseada em índigo (#6366F1).

## 🔄 Fluxo de Navegação

1. **Login** → Tela inicial
2. **Home** → Nova compra → Compra ativa → Adicionar itens
3. **Histórico** → Detalhes da compra
4. **Análises** → Visualização de gastos
5. **Grupo** → Funcionalidade colaborativa (em desenvolvimento)

## 📱 Telas

### Autenticação
- Login com email e senha
- Registro de novos usuários
- Validação de formulários

### Home
- Resumo mensal de gastos
- Compras recentes
- Atalhos rápidos
- Botão para nova compra

### Compras
- Seleção de supermercado
- Adição de itens ao carrinho
- Controle de quantidade
- Cálculo em tempo real
- Finalização da compra

### Histórico
- Lista de todas as compras
- Filtros por período e loja
- Detalhes de cada compra

### Análises
- Gastos mensais
- Categorias mais compradas
- Supermercados favoritos
- Estatísticas e gráficos

## 🛠️ Desenvolvimento

### Executar em modo debug:
```bash
flutter run
```

### Build para produção:
```bash
flutter build apk --release  # Android
flutter build ios --release  # iOS
```

### Análise de código:
```bash
flutter analyze
```

### Testes:
```bash
flutter test
```

## 🔮 Próximos Passos

- [ ] Integração com backend/API
- [ ] Funcionalidade de grupos completa
- [ ] Notificações push
- [ ] Leitura de código de barras
- [ ] Comparação de preços entre lojas
- [ ] Relatórios exportáveis (PDF)
- [ ] Integração com calendário
- [ ] Sugestões inteligentes de compras

## 📄 Licença

Este projeto foi criado como uma migração de um aplicativo Next.js/React para Flutter.

## 👥 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

---

Desenvolvido com ❤️ em Flutter
