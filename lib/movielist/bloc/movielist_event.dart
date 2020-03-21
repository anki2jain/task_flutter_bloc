part of 'movielist_bloc.dart';

abstract class MovielistEvent extends Equatable {
  const MovielistEvent();
}

class GetList extends MovielistEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "movie list";
  }
}
