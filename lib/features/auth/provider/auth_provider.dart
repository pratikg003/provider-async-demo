import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isAuthenticated = false;

  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> login() async {
    _isLoading = true;
    notifyListeners();

    Future.delayed(Duration(seconds: 2));
    
    _isAuthenticated = true;
    _isLoading = false;
    notifyListeners();
  }
  void logout(){
    _isAuthenticated = false;
    notifyListeners();
  }
}
