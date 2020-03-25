part of 'moviesearch_bloc.dart';

abstract class MoviesearchEvent extends Equatable {
  const MoviesearchEvent();
}

class SearchMovies extends MoviesearchEvent {
  final String moviename;

  SearchMovies(this.moviename);
  @override
  List<Object> get props => null;

  String toString() {
    return "Movie search :$moviename";
  }
}
