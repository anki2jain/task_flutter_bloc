import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'moviecasts_event.dart';
part 'moviecasts_state.dart';

class MoviecastsBloc extends Bloc<MoviecastsEvent, MoviecastsState> {
  @override
  MoviecastsState get initialState => MoviecastsInitial();

  @override
  Stream<MoviecastsState> mapEventToState(
    MoviecastsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
