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
  int x = 0;
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
          backgroundColor: Colors.red,
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
              /*  if (state.movie.length == 0) {
                return Center(child: Text("No details prodetailsjsoned :)"));
              } */
              var detailsjson = state.movie;
              print(detailsjson);

              return ListView(
                children: <Widget>[
                  Container(
                    height: 200,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            height: 150,
                            color: Colors.red,
                            child: SizedBox.expand(
                                child: Image.network(
                                    "https://image.tmdb.org/t/p/w500/" +
                                        detailsjson["poster_path"],
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          right: 125,
                          left: 125,
                          child: Container(
                            decoration: new BoxDecoration(
                              // color: Colors.blue,
                              border:
                                  Border.all(color: Colors.white, width: 2.0),
                            ),
                            height: 100,
                            width: 100,
                            // color: Colors.blue,
                            child: SizedBox.expand(
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500/" +
                                    detailsjson["backdrop_path"],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        '${detailsjson["vote_average"]}/10',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Text(
                      detailsjson["overview"],
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 13.0, color: Colors.grey[600]),
                    ),
                    constraints:
                        BoxConstraints(maxHeight: 300.0, minHeight: 50.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (x == 0) {
                              x = 1;
                            } else {
                              x = 0;
                            }
                          });
                        },
                        child: x == 1
                            ? Text(
                                "Read more..",
                                style: TextStyle(color: Colors.grey),
                              )
                            : Text(
                                "Read less..",
                                style: TextStyle(color: Colors.grey),
                              )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: x == 0
                        ? Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Status"),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                  ),
                                  Text("Release Date"),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                  ),
                                  Text("Run Time"),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                  ),
                                  Text("Language"),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                  ),
                                  Text("Genre"),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  detailsjson["status"] == null
                                      ? Text("-")
                                      : Text(detailsjson["status"]),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                  ),
                                  detailsjson["release_date"] == null
                                      ? Text("-")
                                      : Text(detailsjson["release_date"]),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                  ),
                                  // Text(detailsjson["runtime"]),
                                  detailsjson["runtime"] == null
                                      ? Text("-")
                                      : Text("${detailsjson["runtime"]} min"),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                  ),
                                  detailsjson["original_language"] == null
                                      ? Text("-")
                                      : Text(detailsjson["original_language"]),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Text(""),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: detailsjson["genres"].length,
                        itemBuilder: (context, index) {
                          return Text(detailsjson["genres"][index]["name"]);
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      child: Text(
                        "Casts",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                  state.cast["cast"].length == 0
                      ? Center(child: Text("No cast"))
                      : Container(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.cast["cast"].length,
                            itemBuilder: (context, index) {
                              print(state.cast["cast"].length);
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () => null,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.red,
                                        backgroundImage: state.cast["cast"]
                                                    [index]["profile_path"] ==
                                                null
                                            ? NetworkImage(
                                                "http://sfwallpaper.com/images/image-not-available-11.jpg")
                                            : NetworkImage(
                                                "https://image.tmdb.org/t/p/w500/" +
                                                    state.cast["cast"][index]
                                                        ["profile_path"]),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                    ),
                                    Text(state.cast["cast"][index]["name"]),
                                  ],
                                ),
                              );
                            },
                          )),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      child: Text(
                        "Videos",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                  detailsjson["videos"]["results"].length == 0
                      ? Center(child: Text("No videos available sorry :("))
                      : Container(
                          height: 250.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            // height: ,
                            itemCount: detailsjson["videos"]["results"].length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => null,
                                // play(detailsjson["detailsjsoneos"]["results"][index]["key"]),
                                child: new Card(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 170,
                                        width: 120,
                                        child: Builder(
                                            builder: (BuildContext context) {
                                          try {
                                            return Image.network(
                                              'https://image.tmdb.org/t/p/w500/' +
                                                  detailsjson["poster_path"],
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
                                      Flexible(
                                        child: Text(
                                            detailsjson["videos"]["results"][0]
                                                ["name"],
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.clip),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                  Container(),
                ],
              );
            }
            return Center(child: Text("kya hua"));
          },
        ),
      ),
    );
  }
}
