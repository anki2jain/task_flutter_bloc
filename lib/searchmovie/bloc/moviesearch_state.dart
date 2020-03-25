part of 'moviesearch_bloc.dart';

abstract class MoviesearchState extends Equatable {
  const MoviesearchState();
}

class MoviesearchInitial extends MoviesearchState {
  @override
  List<Object> get props => [];
}

class MovieSearching extends MoviesearchState {
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "Loading";
  }
}

class MovieSearchEmpty extends MoviesearchState {
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "Empty";
  }
}

class MovieSearched extends MoviesearchState {
  final Map movieList;

  MovieSearched(this.movieList);
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "Search";
  }
}

class MovieSearchingEror extends MoviesearchState {
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "Error";
  }
}
