import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/sync_download_bloc.dart';

class SyncPage extends StatefulWidget {
  @override
  _SyncPageState createState() => _SyncPageState();
}

class _SyncPageState extends State<SyncPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SyncBloc>(context).add(SyncEventInit());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SyncBloc, SyncState>(
      listener: (context, state) {
        print(state);
        
        if (state is SyncCompleted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/app', (Route<dynamic> route) => false);
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: 70.0, right: 70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/intro.png"),
                width: 150.0,
              ),
              SizedBox(height: 15.0),
              SyncProgress(),
            ],
          ),
        ),
      ),
    );
  }
}

class SyncProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LinearProgressIndicator(),
        SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Loading.."),
          ],
        ),
      ],
    );
  }
}
