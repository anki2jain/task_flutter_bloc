import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  @override
  MovieState get initialState => MovieInitial();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is SearchMovie) {
      final int movieId = event.movieId;
      if (movieId.toString().isEmpty) {
        yield MovieEmpty();
      } else {
        yield MovieLoading();

        try {
          List result = await loadMovies(movieId);
          print(result);

          yield MovieLoadedSuccess(result, movieId);
        } catch (error) {
          yield MovieError();
        }
      }
    }
  }

  Future<List> loadMovies(movieId) async {
    http.Response moviedetails = await http.get(Uri.encodeFull(
        "http://api.themoviedb.org/3/movie/$movieId/videos?api_key=802b2c4b88ea1183e50e6b285a27696e"));

    var movieDetail = jsonDecode(moviedetails.body);
    return movieDetail["results"];
  }

  // Stream _fetchDetailstoState(SearchMovie event) async* {}
}
