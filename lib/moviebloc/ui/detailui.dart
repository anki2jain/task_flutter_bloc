import 'package:credicxotaskapp/moviebloc/bloc/movie_bloc.dart';
import 'package:credicxotaskapp/screens/network_error_screen/nonetwork.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: Scaffold(
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
            if (state is MovieLoadedSuccess) {
              if (state.movie.length == 0) {
                return Center(child: Text("No details provided :)"));
              }
              var detailsjson = state.movie[0];
              return Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${state.movie[0]}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "${detailsjson["id"]}  -- ${detailsjson["name"]} -- ${detailsjson["site"]} -- ${detailsjson["key"]}  "),
                  )
                ],
              ));
            }
            return Center(child: Text("kya hua"));
          },
        ),
      ),
    );
  }
}
