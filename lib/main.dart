import 'package:credicxotaskapp/mainscreen.dart/ui/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'enums/connectivity_status.dart';
import 'movielist/bloc/movielist_bloc.dart';
import 'movielist/ui/movielist.dart';
import 'screens/network_error_screen/nonetwork.dart';
import 'services/network_connection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final MovielistBloc movielistBloc = new MovielistBloc();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
        create: (BuildContext context) =>
            ConnectivityService().connectionStatusController.stream,
        child: MaterialApp(
          title: 'Task by Ankit',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: NetworkSensitive(child: MainScreen()
              /*   child: MovieList(
            movielistbloc: movielistBloc,
          ) */

              ),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(child: Text("Ankit")));
  }
}
