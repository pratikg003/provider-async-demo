import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_async_demo/features/auth/provider/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthProvider>();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: auth.isLoading
              ? null
              : () {
                  context.read<AuthProvider>().login();
                },
          child: Text('Login'),
        ),
      ),
    );
  }
}
