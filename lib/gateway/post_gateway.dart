import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_placeholder/models/post.dart';

class PostGateway {
  final baseUrl = 'https://jsonplaceholder.typicode.com/';

  Future<List<Post>> getPosts() async {
    final response = await get(Uri.parse(baseUrl + 'posts'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final posts = json.map((e) => Post.fromJson(e)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
