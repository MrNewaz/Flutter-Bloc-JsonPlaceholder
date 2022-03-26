part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class LoadingState extends PostsState {}

class LoadedState extends PostsState {
  final List<Post> posts;
  LoadedState({
    required this.posts,
  });
}

class FailedToLoadState extends PostsState {
  final String error;
  FailedToLoadState({
    required this.error,
  });
}
