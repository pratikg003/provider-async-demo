import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_async_demo/providers/post_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => PostProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Async',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<PostProvider>().fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PostProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Async Provider Demo")),
      body: Builder(
        builder: (context) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(provider.error!),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PostProvider>().fetchPosts();
                    },
                    child: Text("Retry"),
                  ),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () {
              return context.read<PostProvider>().fetchPosts();
            },
            child: ListView.builder(
              itemCount: provider.posts.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(provider.posts[index]));
              },
            ),
          );
        },
      ),
    );
  }
}
