import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:tarihte_bugun_app/pages/Today/models/post_model.dart';

import 'package:tarihte_bugun_app/pages/Today/repository/post_api.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    final postApi = PostApi();
    on<RequestPostEvent>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await postApi.getPost();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError());
      }
    });
  }
}
