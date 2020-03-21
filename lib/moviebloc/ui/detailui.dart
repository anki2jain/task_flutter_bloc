import 'package:credicxotaskapp/moviebloc/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Final extends StatefulWidget {
  final MovieBloc moviebloc;

  const Final({Key key, @required this.moviebloc}) : super(key: key);
  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  // MovieBloc moviebloc = new MovieBloc();
  @override
  void initState() {
    // moviebloc.add(SearchMovie("movieId"));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        bloc: widget.moviebloc,
        builder: (context, state) {
          if (state is MovieInitial) {
            return Center(child: Text("Initial State"));
          }
          if (state is MovieError) {
            return Center(child: Text("Error"));
          }
          if (state is MovieLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MovieLoadedSuccess)
            return Center(child: Text("${state.movie[0]}"));

          return Center(child: Text("kya hua"));
        },
      ),
    );
  }
}
