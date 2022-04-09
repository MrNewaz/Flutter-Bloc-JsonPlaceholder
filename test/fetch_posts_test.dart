import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:json_placeholder/gateway/post_gateway.dart';
import 'package:json_placeholder/models/Album.dart';
import 'package:json_placeholder/models/post.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_posts_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() async {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();
      final gateway = PostGateway();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await gateway.fetchAlbum(client), isA<Album>());
    });

    test('returns a List of posts if the http call completes successfully',
        () async {
      final client = MockClient();
      final gateway = PostGateway(client: client);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
          .thenAnswer((_) async => http.Response(
              '[{"userId": 1, "id": 2, "title": "mock", "body":"mock"}]', 200));

      expect(await gateway.getPosts(), [isA<Post>()]);
    });

    test('returns a the post as json when successfully posted', () async {
      final client = MockClient();
      final gateway = PostGateway(client: client);
      final post = Post(userId: 1, id: 2, title: 'mock', body: 'mock');
      const postJson = {
        'userId': '1',
        'title': 'mock',
        'body': 'mock',
        'id': 101
      };

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(
        client.post(
          Uri.parse(
            'https://jsonplaceholder.typicode.com/posts',
          ),
          body: {
            "userId": post.userId,
            "title": post.title,
            "body": post.body,
          },
        ),
      ).thenAnswer((_) async {
        return http.Response(jsonEncode(postJson), 200);
      });

      expect(await gateway.postPost(post), postJson);
    });
  });
}
