import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/sync_download_bloc.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SyncBloc>(context).add(SyncEventInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthenticateBloc, AuthenticateState>(
            listener: (context, state) {
              print(state);
              BlocProvider.of<SyncBloc>(context).add(SyncEventInit());
            },
          ),
          BlocListener<SyncBloc, SyncState>(
            listener: (context, state) {
              print(state);
            },
          ),
        ],
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/intro.png"),
                width: 150.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _routeUserToDestination(AuthenticateState state) {
    if (state is GetLoggedInUserCompleted) {
      print(state.user);

      if (state.user.type == "Delivery" && state.user.nomorPlat == null) {
        //route delivery
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/sync', (Route<dynamic> route) => false);
      } else {
        //route sales
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/sync', (Route<dynamic> route) => false);
      }
    } else if (state is AuthenticateError) {
      //navigate ke halaman login
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    }
  }
}
