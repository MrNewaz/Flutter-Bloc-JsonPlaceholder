import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_placeholder/models/Album.dart';
import 'package:http/http.dart' as http;

import 'package:json_placeholder/models/post.dart';

class PostGateway {
  final Client _client;
  PostGateway({
    Client? client,
  }) : _client = client ?? Client();

  final baseUrl = 'https://jsonplaceholder.typicode.com/';

  Future<List<Post>> getPosts() async {
    final response = await _client.get(Uri.parse(baseUrl + 'posts'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final posts = json.map((e) => Post.fromJson(e)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Album> fetchAlbum(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
