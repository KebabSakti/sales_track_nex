import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/list_visit_bloc.dart';
import 'package:sales_track_nex/utils/helper.dart';
import 'package:sales_track_nex/widget/search_and_periode.dart';

class ListVisit extends StatefulWidget {
  @override
  _ListVisitState createState() => _ListVisitState();
}

class _ListVisitState extends State<ListVisit> {
  // ignore: close_sinks
  AuthenticateBloc authenticateBloc;
  // ignore: close_sinks
  ListVisitBloc listVisitBloc;

  DateTime _periodeAwal = Helper().getPeriode()[0];
  DateTime _periodeAkhir = Helper().getPeriode()[1];
  String _searchKeyword = '';

  void _onSearchFieldChangedListener(value) {
    _searchKeyword = value;

    _fetchDataVisit();
  }

  void _onPeriodeChangedListener(periode) {
    _periodeAwal = periode[0];
    _periodeAkhir = periode[1];

    _fetchDataVisit();
  }

  Future<void> _fetchDataVisit() async {
    listVisitBloc.add(GetDataVisit(
      userId: authenticateBloc.state.user.userId,
      keyword: _searchKeyword,
      periodeAwal: _periodeAwal.toIso8601String(),
      periodeAkhir: _periodeAkhir.toIso8601String(),
    ));
  }

  @override
  void initState() {
    authenticateBloc = BlocProvider.of<AuthenticateBloc>(context);
    listVisitBloc = BlocProvider.of<ListVisitBloc>(context);

    _fetchDataVisit();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _fetchDataVisit,
      child: Column(
        children: <Widget>[
          SearchPeriode(
            onSearchFieldChanged: _onSearchFieldChangedListener,
            onPeriodeChanged: _onPeriodeChangedListener,
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              child: BlocBuilder<ListVisitBloc, ListVisitState>(
                builder: (context, state) {
                  if (state is GetDataVisitComplete) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        var visitWithOutlet = state.visitWithOutlet[index];
                        var date = DateTime.parse(
                            visitWithOutlet.outletData.createdAt);

                        return Card(
                          elevation: 0,
                          color: index.isEven ? Colors.white : Colors.grey[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 15),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Nama Outlet',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Text(
                                      '${visitWithOutlet.outletData.outletName}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Waktu Visit',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          '${Helper().getFormattedDate(date, mDateFormat: DateFormat('d MMM'))}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          '${Helper().getFormattedDate(date, mDateFormat: DateFormat('jm'))}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey[400],
                                  size: 12,
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed('/detail_visit',
                                  arguments: visitWithOutlet);
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(height: 1),
                      itemCount: state.visitWithOutlet.length,
                    );
                  } else if (state is GetDataVisitError) {
                    return Center(
                      child: Text(
                        'Tidak ada data',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
