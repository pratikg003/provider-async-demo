import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isAuthenticated = false;
  String? _token;
  String? _error;

  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  String? get token => _token;
  String? get error => _error;

  Future<void> login({required String email, required String password}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    Future.delayed(Duration(seconds: 2));

    if (email == 'test@test.com' && password == '123456') {
      _token = 'fake_jwt_token_123';
      _isAuthenticated = true;
    } else {
      _error = 'Invalid credentials';
    }

    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _token = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
