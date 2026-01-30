import 'dart:convert';

import 'package:provider_async_demo/core/network/api_client.dart';
import 'package:provider_async_demo/features/models/post.dart';

class PostService {
  final ApiClient _client = ApiClient();
  
  Future<List<Post>> fetchPosts() async{
    final response = await _client.get(
      'https://dummyjson.com/posts'
    );

    if(response.statusCode == 200){
      final decoded = jsonDecode(response.body);
      final List data = decoded['posts'];
      return data.map((e)=> Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}