part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class SearchMovie extends MovieEvent {
  final int movieId;

  SearchMovie(this.movieId);
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "Movie Details requested:$movieId";
  }
}
