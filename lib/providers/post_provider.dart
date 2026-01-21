import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_async_demo/models/post.dart';

class PostProvider extends ChangeNotifier{
  bool _isLoading = false;
  String? _error;
  List<Post> _posts = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Post> get posts => _posts;

  Future<void> fetchPosts({bool force = false}) async {
    if(_isLoading && !force) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')).timeout(Duration(seconds: 5));

      if(response.statusCode != 200){
        throw Exception('Failed to load posts.');
      }

      final List data = jsonDecode(response.body);
      _posts = data.map((e) => Post.fromJson(e)).toList();
    }
     on Exception{
      _error = 'Failed to load posts';
    } finally{
      _isLoading = false;
      notifyListeners();
    }
  } 
}