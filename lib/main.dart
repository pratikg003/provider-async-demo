import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_async_demo/core/network/api_client.dart';
import 'package:provider_async_demo/core/theme/theme_provider.dart';
import 'package:provider_async_demo/features/auth/provider/auth_provider.dart';
import 'package:provider_async_demo/features/auth/widgets/auth_gate.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        // Side-effect: keep ApiClient in sync with auth
        ApiClient().updateToken(auth.token);

        return Consumer<ThemeProvider>(
          builder: (context, theme, _) {
            if (!theme.isLoaded) {
              return const MaterialApp(
                home: Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ),
              );
            }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              home: AuthGate(),
            );
          },
        );
      },
    );
  }
}
