import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:credicxotaskapp/moviebloc/bloc/movie_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;
part 'movielist_event.dart';
part 'movielist_state.dart';

class MovielistBloc extends Bloc<MovielistEvent, MovielistState> {
  @override
  MovielistState get initialState => MovielistInitial();

  @override
  Stream<MovielistState> mapEventToState(
    MovielistEvent event,
  ) async* {
    if (event is GetList) {
      yield MovieListLoading();

      try {
        List result = await loadMovies();
        yield MovieListLoaded(result);
      } catch (err) {
        yield MovieListError();
      }
    }
  }

  Future<List> loadMovies() async {
    http.Response movieList = await http.get(
        "http://api.themoviedb.org/3/movie/popular?api_key=802b2c4b88ea1183e50e6b285a27696e");
    var movielist = jsonDecode(movieList.body);
    print(movielist["results"]);
    return movielist["results"];
  }
}
