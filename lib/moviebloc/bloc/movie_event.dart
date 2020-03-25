part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class GetMovieDetail extends MovieEvent {
  final int movieId;

  GetMovieDetail(this.movieId);
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "Movie Details requested:$movieId";
  }
}
