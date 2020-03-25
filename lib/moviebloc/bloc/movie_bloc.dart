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
    if (event is GetMovieDetail) {
      final int movieId = event.movieId;
      if (movieId.toString().isEmpty) {
        yield MovieEmpty();
      } else {
        yield MovieLoading();

        try {
          Map details = await loadMovies(movieId);
          Map cast = await getCast(movieId);
          yield MovieLoadedSuccess(details, movieId,cast);
        } catch (error) {
          yield MovieError();
        }
      }
    }
  }

  Future<Map> loadMovies(movieId) async {
    http.Response moviedetails = await http.get(Uri.encodeFull(
        "http://api.themoviedb.org/3/movie/$movieId?api_key=2931998c3a80d7806199320f76d65298&append_to_response=videos"));

    var movieDetail = jsonDecode(moviedetails.body);

    return movieDetail;
  }

  Future<Map> getCast(movieId) async {
    http.Response movieCasts = await http.get(Uri.encodeFull(
        "http://api.themoviedb.org/3/movie/$movieId/casts?api_key=2931998c3a80d7806199320f76d65298"));

    var movieCast = jsonDecode(movieCasts.body);

    return movieCast;
  }

  // Stream _fetchDetailstoState(SearchMovie event) async* {}
}
