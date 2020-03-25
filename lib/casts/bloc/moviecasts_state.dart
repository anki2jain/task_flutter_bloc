part of 'moviecasts_bloc.dart';

abstract class MoviecastsState extends Equatable {
  const MoviecastsState();
}

class MoviecastsInitial extends MoviecastsState {
  @override
  List<Object> get props => [];
}
