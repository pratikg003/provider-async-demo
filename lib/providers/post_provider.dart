import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier{
  bool _isLoading = false;
  String? _error;
  List<String> _posts = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<String> get posts => _posts;

  Future<void> fetchPosts() async {
    if(_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try{
      await Future.delayed(const Duration(seconds: 2));

      _posts = [
        'Hello World',
        'Learning Flutter',
        'Providers Async',
        'Day 36'
      ];
    } catch (e){
      _error = 'Failed to load posts';
    } finally{
      _isLoading = false;
      notifyListeners();
    }
  } 
}