import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  const PostState();
  @override
  List<Object> get props => [];
}

class LoadingPostState extends PostState {}

class SuccessPostState extends PostState {
  final List posts;
  const SuccessPostState({required this.posts}); 
  @override
  List<Object> get props => [posts];
}

class ErrorPostState extends PostState {
  final String message;
  const ErrorPostState({required this.message});
  @override
  List<Object> get props => [message];
}
