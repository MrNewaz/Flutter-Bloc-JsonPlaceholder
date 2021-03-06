part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class AllPostLoadedEvent extends PostsEvent {}

class SinglePostLoadedEvent extends PostsEvent {
  final String id;
  SinglePostLoadedEvent({
    required this.id,
  });
}

class PostPostedEvent extends PostsEvent {
  final Post post;
  PostPostedEvent({
    required this.post,
  });
}

class PullToRefreshEvent extends PostsEvent {}
