import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_async_demo/features/auth/provider/auth_provider.dart';
import 'package:provider_async_demo/features/auth/widgets/auth_gate.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
