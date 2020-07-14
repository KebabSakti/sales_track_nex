import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';

class Login extends StatelessWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticateBloc, AuthenticateState>(
      listener: (context, state) {
        if (state is LoginRemoteCompleted) {
          _routeUserType(state.user, context);
        } else if (state is AuthenticateError) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bglogin.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 50.0,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  controller: _username,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                height: 50.0,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 45.0,
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: BlocBuilder<AuthenticateBloc, AuthenticateState>(
                  builder: (context, state) {
                    return _authButtonState(state, context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _authButtonState(AuthenticateState state, BuildContext context) {
    return FlatButton(
      color: Colors.blue[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: (state is AuthenticateLoading)
          ? Container(
              width: 28.0,
              height: 28.0,
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue[100],
                strokeWidth: 3.0,
              ),
            )
          : Text(
              'Login',
              style: TextStyle(
                color: Colors.grey[100],
              ),
            ),
      onPressed: () {
        if (state is! AuthenticateLoading) {
          if (_username.text != "" && _password.text != "") {
            BlocProvider.of<AuthenticateBloc>(context)
                .add(LoginRemote(_username.text, _password.text));
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Username dan password tidak boleh kosong'),
            ));
          }
        }
      },
    );
  }

  void _routeUserType(User user, BuildContext context) {
    if (user.type == "Delivery" && user.nomorPlat == null) {
      //route pilih truk
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/sync', (Route<dynamic> route) => false);
    } else {
      //route dashboard
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/sync', (Route<dynamic> route) => false);
    }
  }
}
