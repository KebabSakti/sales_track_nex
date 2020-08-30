import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/utils/helper.dart';

class ListFaktur extends StatefulWidget {
  @override
  _ListFakturState createState() => _ListFakturState();
}

class _ListFakturState extends State<ListFaktur> {
  // ignore: close_sinks
  AuthenticateBloc authenticateBloc;

  DateTime _periodeAwal = Helper().getPeriode()[0];
  DateTime _periodeAkhir = Helper().getPeriode()[1];
  String _searchKeyword = '';

  void _onSearchFieldChangedListener(value) {
    _searchKeyword = value;

    _fetchData();
  }

  void _onPeriodeChangedListener(periode) {
    _periodeAwal = periode[0];
    _periodeAkhir = periode[1];

    _fetchData();
  }

  Future<void> _fetchData() async {}

  @override
  void initState() {
    authenticateBloc = BlocProvider.of<AuthenticateBloc>(context);

    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
