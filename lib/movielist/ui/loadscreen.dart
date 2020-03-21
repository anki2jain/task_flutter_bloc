import 'package:credicxotaskapp/movielist/ui/movielist.dart';
import 'package:credicxotaskapp/movielist/bloc/movielist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Load extends StatefulWidget {
  // final MovielistBloc movielistbloc;

  // const Load({Key key, @required this.movielistbloc}) : super(key: key);

  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  MovielistBloc movielistbloc = new MovielistBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Movie List")),
        body: Center(
          child: MaterialButton(
            onPressed: () {
              movielistbloc.add(GetList());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieList(
                            movielistbloc: movielistbloc,
                          )));
            },
            child: Text("Load data "),
          ),
        ));
  }
}
