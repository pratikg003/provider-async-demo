import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isAuthenticated = false;
  String? _token;

  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  String? get token => _token;

  Future<void> login() async {
    _isLoading = true;
    notifyListeners();

    Future.delayed(Duration(seconds: 2));
    
    _token = 'fake_jwt_token_123';
    _isAuthenticated = true;

    _isLoading = false;
    notifyListeners();
  }
  void logout(){
    _token = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
