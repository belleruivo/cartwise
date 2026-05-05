# 🔧 Configuração do Ambiente Flutter

## Pré-requisitos

Antes de executar o projeto Cartwise, você precisa ter o Flutter instalado e configurado.

## 📥 Instalação do Flutter

### Windows

1. **Baixe o Flutter SDK:**
   - Acesse: https://docs.flutter.dev/get-started/install/windows
   - Baixe o arquivo ZIP do Flutter

2. **Extraia o ZIP:**
   ```
   C:\src\flutter
   ```

3. **Adicione ao PATH:**
   - Painel de Controle → Sistema → Configurações Avançadas
   - Variáveis de Ambiente
   - PATH → Adicionar: `C:\src\flutter\bin`

4. **Verifique a instalação:**
   ```bash
   flutter doctor
   ```

### macOS

1. **Baixe o Flutter SDK:**
   ```bash
   cd ~/development
   unzip ~/Downloads/flutter_macos_*.zip
   ```

2. **Adicione ao PATH (bash):**
   ```bash
   echo 'export PATH="$PATH:~/development/flutter/bin"' >> ~/.bash_profile
   source ~/.bash_profile
   ```

   **Ou (zsh):**
   ```bash
   echo 'export PATH="$PATH:~/development/flutter/bin"' >> ~/.zshrc
   source ~/.zshrc
   ```

3. **Verifique:**
   ```bash
   flutter doctor
   ```

### Linux

1. **Baixe e extraia:**
   ```bash
   cd ~/development
   tar xf ~/Downloads/flutter_linux_*.tar.xz
   ```

2. **Adicione ao PATH:**
   ```bash
   echo 'export PATH="$PATH:~/development/flutter/bin"' >> ~/.bashrc
   source ~/.bashrc
   ```

3. **Verifique:**
   ```bash
   flutter doctor
   ```

## 🔍 Flutter Doctor

Execute `flutter doctor` para verificar dependências:

```bash
flutter doctor -v
```

### Resultado Esperado:
```
[✓] Flutter (Channel stable, 3.x.x)
[✓] Android toolchain - develop for Android devices
[✓] Chrome - develop for the web
[✓] Visual Studio Code (version x.x)
[✓] Connected device (x available)
```

## 📱 Configuração de Dispositivos

### Android

1. **Instale Android Studio:**
   - Download: https://developer.android.com/studio

2. **Configure Android SDK:**
   - Android Studio → SDK Manager
   - Instale SDK Platform 33 ou superior
   - Instale Build Tools

3. **Crie um emulador:**
   - AVD Manager → Create Virtual Device
   - Escolha um dispositivo (ex: Pixel 5)
   - Selecione uma imagem do sistema (API 33+)

4. **Aceite licenças:**
   ```bash
   flutter doctor --android-licenses
   ```

### iOS (macOS apenas)

1. **Instale Xcode:**
   - App Store → Xcode

2. **Configure Xcode:**
   ```bash
   sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   sudo xcodebuild -runFirstLaunch
   ```

3. **Instale CocoaPods:**
   ```bash
   sudo gem install cocoapods
   ```

4. **Crie um simulador:**
   - Xcode → Window → Devices and Simulators

### Web

Já vem configurado! Apenas tenha o Chrome instalado.

## 🎯 Configuração do VS Code

### Extensões Recomendadas:

1. **Flutter** (Dart-Code.flutter)
2. **Dart** (Dart-Code.dart-code)
3. **Awesome Flutter Snippets** (Nash.awesome-flutter-snippets)

### Instalar via terminal:
```bash
code --install-extension Dart-Code.flutter
code --install-extension Dart-Code.dart-code
code --install-extension Nash.awesome-flutter-snippets
```

### Configurações (settings.json):
```json
{
  "dart.flutterSdkPath": "C:\\src\\flutter",
  "dart.previewFlutterUiGuides": true,
  "dart.previewFlutterUiGuidesCustomTracking": true,
  "editor.formatOnSave": true,
  "editor.rulers": [80]
}
```

## 🚀 Executando o Projeto Cartwise

### 1. Navegue para o projeto:
```bash
cd flutter_cartwise
```

### 2. Verifique dispositivos disponíveis:
```bash
flutter devices
```

### 3. Instale dependências:
```bash
flutter pub get
```

### 4. Execute o app:
```bash
# Dispositivo padrão
flutter run

# Dispositivo específico
flutter run -d chrome
flutter run -d android
flutter run -d ios
```

## 🔧 Comandos Úteis

### Análise de código:
```bash
flutter analyze
```

### Formatar código:
```bash
flutter format .
```

### Limpar cache:
```bash
flutter clean
```

### Atualizar dependências:
```bash
flutter pub upgrade
```

### Ver versão:
```bash
flutter --version
```

### Atualizar Flutter:
```bash
flutter upgrade
```

## 📊 Performance

### Debug vs Release:

**Debug mode** (desenvolvimento):
```bash
flutter run
```

**Release mode** (produção):
```bash
flutter run --release
```

**Profile mode** (análise de performance):
```bash
flutter run --profile
```

## 🐛 Troubleshooting Comum

### Problema: "Command not found: flutter"
**Solução:** Flutter não está no PATH. Adicione novamente.

### Problema: "Unable to locate Android SDK"
**Solução:**
```bash
flutter config --android-sdk /path/to/android/sdk
```

### Problema: Gradle build failed
**Solução:**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

### Problema: CocoaPods not installed
**Solução:**
```bash
sudo gem install cocoapods
```

### Problema: Certificate verification failed
**Solução:**
```bash
flutter pub get --no-verify
```

## 📚 Recursos Adicionais

- 📖 [Flutter Documentation](https://docs.flutter.dev/)
- 🎓 [Flutter Codelabs](https://docs.flutter.dev/codelabs)
- 💬 [Flutter Community](https://flutter.dev/community)
- 📦 [Pub.dev](https://pub.dev/) - Pacotes Dart/Flutter
- 🎨 [Material Design](https://m3.material.io/)

## ✅ Checklist Final

Antes de começar o desenvolvimento:

- [ ] Flutter instalado (`flutter --version`)
- [ ] Doctor sem erros (`flutter doctor`)
- [ ] Emulador/Dispositivo configurado
- [ ] VS Code com extensões instaladas
- [ ] Projeto clonado
- [ ] Dependências instaladas (`flutter pub get`)
- [ ] App executando (`flutter run`)

## 🎉 Pronto!

Agora você está pronto para desenvolver com Flutter!

Execute o projeto Cartwise:
```bash
cd flutter_cartwise
flutter pub get
flutter run
```

---

**Happy Coding! 🚀**
