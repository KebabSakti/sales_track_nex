import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/sync_bloc.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SyncBloc>(context).add(ShouldSync());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: MultiBlocListener(
        listeners: [
          BlocListener<SyncBloc, SyncState>(
            listener: (context, state) {
              if (state is SyncLoading) {
                print(state.message);
              } else if (state is ShouldSyncResponse) {
                if (state.response) {
                  BlocProvider.of<SyncBloc>(context).add(Sync());
                } else {
                  BlocProvider.of<AuthenticateBloc>(context)
                      .add(GetLoggedInUser());
                }
              } else if (state is SyncCompleted) {
                BlocProvider.of<AuthenticateBloc>(context)
                    .add(GetLoggedInUser());
              }

              print(state);
            },
          ),
          BlocListener<AuthenticateBloc, AuthenticateState>(
            listener: (context, state) {
              Timer(Duration(seconds: 3), () {
                _routeUserToDestination(state);
              });
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
              SizedBox(height: 10),
              Container(
                width: 150,
                child: LinearProgressIndicator(),
              ),
              SizedBox(height: 5),
              BlocBuilder<SyncBloc, SyncState>(
                builder: (context, state) {
                  if (state is SyncLoading)
                    return Center(
                      child: Text(state.message),
                    );
                  else
                    return Center(
                      child: Text('redirect user'),
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _routeUserToDestination(AuthenticateState state) {
    if (state is GetLoggedInUserCompleted) {
      //route ke dashboard
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/app', (Route<dynamic> route) => false);
    } else if (state is AuthenticateError) {
      //navigate ke halaman login
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    }
  }
}
