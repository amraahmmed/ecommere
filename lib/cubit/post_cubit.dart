import 'dart:convert';
import 'package:ecommere/cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(LoadingPostState());

  Future<void> getPosts() async {
    emit(LoadingPostState());
    try {
      final response = await get(
        Uri.parse("https://dummyjson.com/products"),
        headers: {"Accept": "application/json"},
      );
      final responseBody = jsonDecode(response.body);
      final List products = responseBody["products"];
      emit(SuccessPostState(posts: products));
    } catch (e) {
      emit(ErrorPostState(message: e.toString()));
    }
  }
}
