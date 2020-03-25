import 'package:credicxotaskapp/movielist/bloc/movielist_bloc.dart';
import 'package:credicxotaskapp/movielist/ui/movielist.dart';
import 'package:credicxotaskapp/searchmovie/bloc/moviesearch_bloc.dart';
import 'package:credicxotaskapp/searchmovie/ui/searchresult.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  // final MovielistBloc movielistbloc;

  // const MainScreen({Key key, @required this.movielistbloc}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MovielistBloc movielistBloc = new MovielistBloc();
  MoviesearchBloc searchmovie = MoviesearchBloc();
  TextEditingController _search = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          actions: <Widget>[Icon(Icons.more_vert)],
          expandedHeight: 150.0,
          floating: false,
          pinned: true,
          backgroundColor: Colors.red,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text("Box Office"),
            background: Container(
              child: Container(
                color: Colors.red,
                height: 150.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 75.0,
                      left: 40.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          height: 40.0,
                          width: 270.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextField(
                              // key: _formkey,
                              controller: _search,
                              onSubmitted: (value) {
                                _search.clear();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchResult(moviename: value)));
                              },
                              decoration: InputDecoration.collapsed(
                                  // icon: Icon(Icons.search),
                                  border: InputBorder.none,
                                  // prefixIcon: Icon(Icons.search),

                                  hintText: "Search Movies,TV Shows"
                                  // disabledBorder:
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        MovieList(
          movielistbloc: movielistBloc,
        )
      ],
    ));
  }
}
