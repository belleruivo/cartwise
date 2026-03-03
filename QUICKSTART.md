# 🚀 Início Rápido - Cartwise Flutter

## Instalação e Execução

### 1. Navegue até o diretório do projeto Flutter
```bash
cd flutter_cartwise
```

### 2. Instale as dependências
```bash
flutter pub get
```

### 3. Verifique se há dispositivos disponíveis
```bash
flutter devices
```

### 4. Execute o aplicativo
```bash
flutter run
```

## Comandos Úteis

### Executar em modo debug com hot reload
```bash
flutter run
```

### Build para produção (Android)
```bash
flutter build apk --release
```

### Build para produção (iOS)
```bash
flutter build ios --release
```

### Análise de código
```bash
flutter analyze
```

### Limpar build
```bash
flutter clean
flutter pub get
```

### Verificar versão do Flutter
```bash
flutter --version
```

## Estrutura do App

```
flutter_cartwise/
├── lib/
│   ├── main.dart                    # Ponto de entrada
│   ├── models/                      # Modelos de dados
│   │   ├── purchase.dart
│   │   └── cart_item.dart
│   ├── providers/                   # Estado global
│   │   └── app_state.dart
│   └── screens/                     # Todas as telas
│       ├── cartwise_app.dart        # App principal
│       ├── auth/
│       ├── home/
│       ├── purchase/
│       ├── history/
│       ├── analytics/
│       └── group/
├── pubspec.yaml                     # Dependências
└── README.md                        # Documentação
```

## Telas Disponíveis

1. **Login/Registro** - Autenticação de usuários
2. **Home** - Dashboard com resumo de gastos
3. **Nova Compra** - Seleção de supermercado
4. **Compra Ativa** - Lista de itens em tempo real
5. **Adicionar Item** - Formulário de novo item
6. **Histórico** - Lista de compras anteriores
7. **Detalhes** - Visualização completa de uma compra
8. **Análises** - Estatísticas e gráficos
9. **Grupo** - Funcionalidade colaborativa

## Navegação entre Telas

O app usa navegação baseada em estado (Provider):

```dart
// Exemplo de navegação
context.read<AppState>().setScreen('nova-compra');
context.read<AppState>().setActiveTab('historico');
```

## Bottom Navigation

4 tabs principais:
- 🏠 Home
- 🕐 Histórico
- 📊 Análises
- 👥 Grupo

## Tema

- Suporte a **Dark Mode** e **Light Mode**
- Baseado em **Material Design 3**
- Cor primária: **#6366F1** (Indigo)

## Dados de Teste

O app vem com dados mockados para demonstração:
- 4 compras de exemplo
- 5 itens de carrinho
- Múltiplas categorias

## Troubleshooting

### Erro: "Unable to find package"
```bash
flutter pub get
```

### Erro: "Gradle build failed"
```bash
flutter clean
flutter pub get
flutter run
```

### Ícones não aparecem
Os ícones Lucide são carregados automaticamente. Se houver problemas:
```bash
flutter clean
flutter pub get
```

### Hot reload não funciona
Pressione `r` no terminal onde o app está rodando, ou `R` para hot restart completo.

## Recursos Adicionais

- 📖 [Documentação Flutter](https://flutter.dev/docs)
- 🎨 [Material Design 3](https://m3.material.io/)
- 📦 [Pub.dev - Pacotes](https://pub.dev/)
- 💬 [Flutter Community](https://flutter.dev/community)

## Suporte

Para problemas ou dúvidas:
1. Verifique o `MIGRATION_GUIDE.md`
2. Consulte o `README.md` completo
3. Execute `flutter doctor` para diagnóstico

---

**Desenvolvido com Flutter 💙**
