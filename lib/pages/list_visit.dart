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

  DateTime periodeAwal = DateTime.parse('2020-08-24');
  DateTime periodeAkhir = DateTime.parse('2020-08-24');

  void _onSearchFieldChangedListener(v) {
    print(v);
  }

  void _onPeriodeAwalChangedListener(v) {
    periodeAwal = v;
  }

  void _onPeriodeAkhirChangedListener(v) {
    periodeAkhir = v;
  }

  @override
  void initState() {
    authenticateBloc = BlocProvider.of<AuthenticateBloc>(context);
    listVisitBloc = BlocProvider.of<ListVisitBloc>(context);

    listVisitBloc.add(GetDataVisit(
      userId: authenticateBloc.state.user.userId,
      keyword: '',
      periodeAwal: periodeAwal,
      periodeAkhir: periodeAkhir,
    ));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchPeriode(
          onSearchFieldChanged: _onSearchFieldChangedListener,
          onPeriodeAwalChanged: _onPeriodeAwalChangedListener,
          onPeriodeAkhirChanged: _onPeriodeAkhirChangedListener,
        ),
        SizedBox(height: 10),
        Expanded(
          child: Container(
              color: Colors.white,
              child: BlocBuilder<ListVisitBloc, ListVisitState>(
                builder: (context, state) {
                  if (state is GetDataVisitComplete) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        var visitWithOutlet = state.visitWithOutlet[index];
                        var date = visitWithOutlet.outletData.createdAt;

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
                                  size: 20,
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(height: 1),
                      itemCount: state.visitWithOutlet.length,
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )),
        ),
      ],
    );
  }
}
