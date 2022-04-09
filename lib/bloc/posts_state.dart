part of 'posts_bloc.dart';

enum PostStatus { loading, loaded, error }

class PostsState extends Equatable {
  final List<Post> posts;
  final Post? post;
  final PostStatus status;
  final String? error;
  const PostsState({
    required this.posts,
    this.post,
    required this.status,
    this.error,
  });

  factory PostsState.initial() => const PostsState(
        posts: [],
        post: null,
        status: PostStatus.loading,
        error: null,
      );

  @override
  List<Object?> get props => [posts, post, status, error];

  @override
  String toString() {
    return 'PostsState(posts: $posts, post: $post, status: $status, error: $error)';
  }

  PostsState copyWith({
    List<Post>? posts,
    Post? post,
    PostStatus? status,
    String? error,
  }) {
    return PostsState(
      posts: posts ?? this.posts,
      post: post ?? this.post,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
