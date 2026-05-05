import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  String _currentScreen = 'login';
  String _activeTab = 'home';
  String _storeName = '';
  int? _selectedPurchaseId;
  bool _isAuthenticated = false;

  ThemeMode get themeMode => _themeMode;
  String get currentScreen => _currentScreen;
  String get activeTab => _activeTab;
  String get storeName => _storeName;
  int? get selectedPurchaseId => _selectedPurchaseId;
  bool get isAuthenticated => _isAuthenticated;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setScreen(String screen) {
    _currentScreen = screen;
    notifyListeners();
  }

  void setActiveTab(String tab) {
    _activeTab = tab;
    _currentScreen = 'main';
    notifyListeners();
  }

  void setStoreName(String name) {
    _storeName = name;
    notifyListeners();
  }

  void selectPurchase(int id) {
    _selectedPurchaseId = id;
    _currentScreen = 'detalhe-compra';
    notifyListeners();
  }

  void login() {
    _isAuthenticated = true;
    _currentScreen = 'main';
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _currentScreen = 'login';
    notifyListeners();
  }

  void startPurchase(String name) {
    _storeName = name;
    _currentScreen = 'compra-ativa';
    notifyListeners();
  }
}
