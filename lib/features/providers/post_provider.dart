import 'package:flutter/material.dart';
import 'package:provider_async_demo/features/models/post.dart';
import 'package:provider_async_demo/features/service/post_service.dart';

class PostProvider extends ChangeNotifier {
  final PostService _service = PostService();
  bool _isLoading = false;
  String? _error;
  List<Post> _posts = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Post> get posts => _posts;

 Future<void> fetchPosts({bool force = false}) async {
  _isLoading = true;
  _error = null;
  notifyListeners();

  try{
    _posts = await _service.fetchPosts();
  } catch (e) {
    _error = e.toString();
  }

  _isLoading = false;
  notifyListeners();
}

}
