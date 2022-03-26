import 'package:bloc/bloc.dart';
import 'package:json_placeholder/gateway/post_gateway.dart';
import 'package:json_placeholder/models/post.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _postGateway = PostGateway();
  PostsBloc() : super(LoadingState()) {
    on<PostsEvent>((event, emit) async {
      if (event is LoadEvent || event is PullToRefreshEvent) {
        emit(LoadingState());
        try {
          final posts = await _postGateway.getPosts();
          emit(LoadedState(posts: posts));
        } catch (e) {
          emit(FailedToLoadState(error: e.toString()));
        }
      }
    });
  }
}
