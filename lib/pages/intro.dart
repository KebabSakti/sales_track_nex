import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/outlet_bloc.dart';
import 'package:sales_track_nex/data/outlet_data.dart';
import 'package:sales_track_nex/event/outlet_event.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OutletBloc>(context).add(OutletEvent.init);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
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
              margin: EdgeInsets.only(left: 100.0, right: 100.0),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[400],
              ),
            ),
            SizedBox(height: 10.0),
            BlocBuilder<OutletBloc, List<OutletData>>(
              builder: (context, state) {
                return Text(state.length == 0 ? 'Loading' : '');
              },
            ),
          ],
        ),
      ),
    );
  }
}
