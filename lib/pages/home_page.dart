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
          if (state is LoadedState) {
            return RefreshIndicator(
              onRefresh: () async => context.read<PostsBloc>().add(
                    PullToRefreshEvent(),
                  ),
              child: ListView.builder(
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
              ),
            );
          } else if (state is FailedToLoadState) {
            return Center(
              child: Text(state.error),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
