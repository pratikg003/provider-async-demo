import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_async_demo/features/auth/provider/auth_provider.dart';
import 'package:provider_async_demo/features/screens/home_screen.dart';
import 'package:provider_async_demo/features/screens/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    if (auth.isLoading){
      return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
    }
    return auth.isAuthenticated ? HomeScreen() : LoginScreen();
  }
}