import 'package:credicxotaskapp/moviebloc/bloc/movie_bloc.dart';
import 'package:credicxotaskapp/moviebloc/ui/detailui.dart';
import 'package:credicxotaskapp/searchmovie/bloc/moviesearch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResult extends StatefulWidget {
  final String moviename;

  const SearchResult({Key key, this.moviename}) : super(key: key);
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  MoviesearchBloc searchmovie = new MoviesearchBloc();
  MovieBloc moviebloc = new MovieBloc();
  @override
  void initState() {
    super.initState();
    searchmovie.add(SearchMovies(widget.moviename));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text("Search result")),
      body: BlocBuilder<MoviesearchBloc, MoviesearchState>(
        bloc: searchmovie,
        builder: (context, state) {
          print(state);
          if (state is MovieSearching) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MovieSearchingEror) {
            return Center(child: Text("Error"));
          }
          if (state is MovieSearchEmpty) {
            return Center(child: Text("Empty search"));
          }

          if (state is MovieSearched) {
            if (state.movieList["results"].length == 0) {
              return Center(
                child: Text("No movie found :("),
              );
            }
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  Map movielist = state.movieList["results"][index];

                  return GestureDetector(
                    onTap: () {
                      moviebloc.add(GetMovieDetail(movielist["id"]));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Final(
                                    moviebloc: moviebloc,
                                  )));
                    },
                    child: Card(
                      child: Container(
                          height: 500,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 138,
                                child: Builder(builder: (BuildContext context) {
                                  try {
                                    return Image.network(
                                      'https://image.tmdb.org/t/p/w500' +
                                          movielist["poster_path"],
                                      fit: BoxFit.fitHeight,
                                    );
                                  } catch (e) {
                                    return Image.network(
                                      'http://sfwallpaper.com/images/image-not-available-11.jpg',
                                      fit: BoxFit.fitHeight,
                                    );
                                  }
                                }),
                              ),
                              Row(
                                children: <Widget>[
                                  Flexible(child: Builder(builder: (context) {
                                    try {
                                      return Text(movielist["name"],
                                          overflow: TextOverflow.ellipsis);
                                    } catch (e) {
                                      return Text(movielist["title"],
                                          overflow: TextOverflow.ellipsis);
                                    }
                                  })),
                                ],
                              )
                            ],
                          )),
                    ),
                  );
                },
                itemCount: state.movieList["results"].length);
          }
          return Text("data");
        },
      ),
    );
  }
}
