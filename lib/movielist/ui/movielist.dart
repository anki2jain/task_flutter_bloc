import 'package:credicxotaskapp/moviebloc/bloc/movie_bloc.dart';
import 'package:credicxotaskapp/moviebloc/ui/detailui.dart';
import 'package:credicxotaskapp/movielist/bloc/movielist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieList extends StatefulWidget {
  final MovielistBloc movielistbloc;

  const MovieList({Key key, @required this.movielistbloc}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieBloc moviebloc = new MovieBloc();
  MovielistBloc movielistbloc = new MovielistBloc();
  @override
  void initState() {
    widget.movielistbloc.add(GetList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie List")),
      body: BlocBuilder<MovielistBloc, MovielistState>(
        bloc: widget.movielistbloc,
        builder: (context, state) {
          if (state is MovieListLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MovieListError) {
            return Center(child: Text("Error"));
          }
          if (state is MovieListLoaded) {
            return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  var movid = state.movies[index]["id"];
                  if (state.movies.length == 0) {
                    return Center(
                      child: Text("no popular movies :)"),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      moviebloc.add(SearchMovie(movid));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Final(
                                    moviebloc: moviebloc,
                                  )));
                    },
                    child: Card(
                        child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${state.movies[index]["poster_path"]}"),
                          ),
                        ),
                        Flexible(
                            child: Text("${state.movies[index]["title"]}",
                                overflow: TextOverflow.ellipsis)),
                      ],
                    )),
                  );
                });
          }
          return Center(
            child: MaterialButton(
              onPressed: () {},
              child: Text("Load data "),
            ),
          );
        },
      ),
    );
  }
}
