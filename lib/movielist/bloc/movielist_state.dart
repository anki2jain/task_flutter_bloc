part of 'movielist_bloc.dart';

abstract class MovielistState extends Equatable {
  const MovielistState();
}

class MovielistInitial extends MovielistState {
  @override
  List<Object> get props => [];
}

class MovieListLoading extends MovielistState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "loading";
  }
}

class MovieListLoaded extends MovielistState {
  final List movies;

  MovieListLoaded(this.movies);
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "loaded successfully";
  }
}

class MovieListError extends MovielistState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "loading error";
  }
}
