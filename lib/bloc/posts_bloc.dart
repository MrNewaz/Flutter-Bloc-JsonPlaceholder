import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_placeholder/gateway/post_gateway.dart';
import 'package:json_placeholder/models/post.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _postGateway = PostGateway();
  PostsBloc() : super(PostsState.initial()) {
    on<AllPostLoadedEvent>((event, emit) async {
      final posts = await _postGateway.getPosts();
      emit(state.copyWith(
        status: PostStatus.loaded,
        posts: posts,
      ));
    });
    on<SinglePostLoadedEvent>((event, emit) async {
      final posts = await _postGateway.getPosts();
      emit(state.copyWith(
        status: PostStatus.loaded,
        posts: posts,
      ));
    });
  }
}
