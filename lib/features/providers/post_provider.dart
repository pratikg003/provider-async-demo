import 'package:flutter/material.dart';
import 'package:provider_async_demo/features/models/post.dart';
import 'package:provider_async_demo/features/service/post_service.dart';

enum LoadState {
  idle,
  loading,
  success,
  empty,
  error,
}
  
class PostProvider extends ChangeNotifier {
  final PostService _service = PostService();

  LoadState state = LoadState.idle;
  String? error;
  List<Post> posts = [];

  // bool get isLoading => _isLoading;
  // String? get error => _error;
  // List<Post> get posts => _posts;

 Future<void> fetchPosts({bool force = false}) async {
  state = LoadState.loading;
  error = null;
  notifyListeners();

  try{
    posts = await _service.fetchPosts();

    if(posts.isEmpty){
      state = LoadState.empty;
    } else {
      state = LoadState.success;
    }
  } catch (e) {
    error = e.toString();
    state = LoadState.error;
  }

  notifyListeners();
}

}
