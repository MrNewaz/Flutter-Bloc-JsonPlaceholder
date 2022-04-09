part of 'posts_bloc.dart';

enum PostStatus { loading, loaded, error }

class PostsState extends Equatable {
  final List<Post> posts;
  final Post? post;
  final PostStatus status;
  final String? error;
  final Object? posted;

  const PostsState({
    required this.posts,
    this.post,
    required this.status,
    this.error,
    this.posted,
  });

  factory PostsState.initial() => const PostsState(
        posts: [],
        post: null,
        status: PostStatus.loading,
        error: null,
        posted: {},
      );

  @override
  List<Object?> get props {
    return [
      posts,
      post,
      status,
      error,
      posted,
    ];
  }

  @override
  String toString() {
    return 'PostsState(posts: $posts, post: $post, status: $status, error: $error, posted: $posted)';
  }

  PostsState copyWith({
    List<Post>? posts,
    Post? post,
    PostStatus? status,
    String? error,
    Object? posted,
  }) {
    return PostsState(
      posts: posts ?? this.posts,
      post: post ?? this.post,
      status: status ?? this.status,
      error: error ?? this.error,
      posted: posted ?? this.posted,
    );
  }
}
