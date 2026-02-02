import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_async_demo/features/providers/post_provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
      context.read<PostProvider>().fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PostProvider>();
    switch (provider.state) {
      case LoadState.loading:
        return Scaffold(body: const Center(child: CircularProgressIndicator()));

      case LoadState.error:
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(provider.error ?? 'Something went wrong!'),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    context.read<PostProvider>().fetchPosts(force: true);
                  },
                  child: Text('Retry'),
                ),
              ],
            ),
          ),
        );
      case LoadState.empty:
        return Scaffold(body: Center(child: Text('No posts available!')));
      case LoadState.success:
        return Scaffold(
          body: ListView.builder(
            itemCount: provider.posts.length,
            itemBuilder: (_, index) {
              final post = provider.posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
