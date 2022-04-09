import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder/bloc/posts_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.error:
              return const Center(child: Text('Error'));
            case PostStatus.loaded:
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  final post = state.posts[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          post.id.toString(),
                        ),
                      ),
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
