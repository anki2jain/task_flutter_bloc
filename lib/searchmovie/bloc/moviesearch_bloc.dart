import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'moviesearch_event.dart';
part 'moviesearch_state.dart';

class MoviesearchBloc extends Bloc<MoviesearchEvent, MoviesearchState> {
  @override
  MoviesearchState get initialState => MoviesearchInitial();

  @override
  Stream<MoviesearchState> mapEventToState(
    MoviesearchEvent event,
  ) async* {
    if (event is SearchMovies) {
      yield MovieSearching();
      String moviename = event.moviename;
      if (moviename.isEmpty) {
        yield MovieSearchEmpty();
      } else {
        yield MovieSearching();

        try {
          Map movieList = await getmovies(moviename);

          yield MovieSearched(movieList);
        } catch (error) {
          yield MovieSearchingEror();
        }
      }
    }
  }

  Future<Map> getmovies(moviename) async {
    http.Response moviedetails = await http.get(Uri.encodeFull(
        "https://api.themoviedb.org/3/search/multi?api_key=2931998c3a80d7806199320f76d65298&query=$moviename&page=1&include_adult=false"));

    var movieDetail = jsonDecode(moviedetails.body);
    print(movieDetail);
    return movieDetail;
  }
}
