import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_async_demo/features/auth/provider/auth_provider.dart';
import 'package:provider_async_demo/features/providers/post_provider.dart';
import 'package:provider_async_demo/features/screens/posts_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: (){
              context.read<AuthProvider>().logout();
            },
            icon: Icon(Icons.logout_sharp),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                  create: (_) => PostProvider(),
                  child: PostsScreen(),
                ),
              ),
            );
          },
          child: Text("View Posts"),
        ),
      ),
    );
  }
}
