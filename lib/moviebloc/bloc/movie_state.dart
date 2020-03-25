part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState([List props = const []]);
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoading extends MovieState {
  @override
  String toString() {
    return "Loading";
  }

  @override
  List<Object> get props => [];
}

class MovieEmpty extends MovieState {
  @override
  String toString() {
    return "Empty";
  }

  @override
  List<Object> get props => [];
}

class MovieLoadedSuccess extends MovieState {
  final Map movie;
  final int movieId;
  final Map cast;

  MovieLoadedSuccess(this.movie, this.movieId, this.cast);
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "Loaded successfully";
  }
}

class MovieError extends MovieState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "Error occured";
  }
}
