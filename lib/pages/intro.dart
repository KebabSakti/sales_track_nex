import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticateBloc>(context).add(GetLoggedInUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: BlocListener<AuthenticateBloc, AuthenticateState>(
        listener: (context, state) {
          _routeUserToDestination(state);
        },
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
              SizedBox(height: 15.0),
              Container(
                width: 120.0,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[400],
                ),
              ),
              SizedBox(height: 10.0),
              Text('Loading'),
            ],
          ),
        ),
      ),
    );
  }

  _routeUserToDestination(AuthenticateState state) {
    if (state is GetLoggedInUserCompleted) {
      print(state.user);

      if (state.user.type == "Delivery" && state.user.nomor_plat == null) {
        //route delivery
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/app', (Route<dynamic> route) => false);
      } else {
        //route sales
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/app', (Route<dynamic> route) => false);
      }
    } else if (state is AuthenticateError) {
      //navigate ke halaman login
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    }
  }
}
