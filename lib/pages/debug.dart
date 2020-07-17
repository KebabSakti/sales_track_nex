import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/sync_download_bloc.dart';

class DebugPage extends StatefulWidget {
  @override
  _DebugPageState createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SyncBloc, SyncState>(
      listener: (context, state) {
        print(state);
      },
      child: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              BlocProvider.of<SyncBloc>(context).add(DeleteAllOutlet());
            },
            child: Text("Clear Database"),
          ),
        ),
      ),
    );
  }
}
