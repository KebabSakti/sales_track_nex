import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/jadwal_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/widget/jadwal_item.dart';

class Jadwal extends StatefulWidget {
  @override
  _JadwalState createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  // ignore: close_sinks
  AuthenticateBloc authenticateBloc;
  // ignore: close_sinks
  JadwalBloc jadwalBloc;

  Future<void> _fetchJadwal() async {
    jadwalBloc.add(GetJadwal(
        DateTime.now().toIso8601String(), authenticateBloc.state.user));
  }

  @override
  void initState() {
    authenticateBloc = BlocProvider.of<AuthenticateBloc>(context);
    jadwalBloc = BlocProvider.of<JadwalBloc>(context);

    _fetchJadwal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _fetchJadwal,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: BlocBuilder<JadwalBloc, JadwalState>(
              builder: (context, state) {
                if (state is GetJadwalCompleted) {
                  return Column(
                    children: <Widget>[
                      JadwalInsight(jadwal: state.jadwalWithOutlet),
                      SizedBox(height: 10),
                    ],
                  );
                }

                return SizedBox.shrink();
              },
            ),
          ),
          BlocBuilder<JadwalBloc, JadwalState>(
            builder: (context, state) {
              if (state is GetJadwalCompleted) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext contex, int index) {
                      var jadwal = state.jadwalWithOutlet[index];

                      return JadwalItem(jadwal: jadwal);
                    },
                    childCount: state.jadwalWithOutlet.length,
                  ),
                );
              } else if (state is GetJadwalError) {
                return SliverToBoxAdapter(
                  child: Center(
                    heightFactor: 10,
                    child: Text(
                      'Belum ada jadwal',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                );
              }

              return SliverToBoxAdapter(
                child: Center(
                  heightFactor: 5,
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class JadwalInsight extends StatefulWidget {
  final List<JadwalWithOutlet> jadwal;

  JadwalInsight({Key key, @required this.jadwal});

  @override
  _JadwalInsightState createState() => _JadwalInsightState();
}

class _JadwalInsightState extends State<JadwalInsight> {
  int visit = 0;
  int unVisit = 0;
  int total = 0;

  @override
  void initState() {
    List<OutletData> listVisit = [];
    List<OutletData> listUnVisit = [];

    widget.jadwal.forEach((item) {
      if (item.jadwalData.visit == 1) {
        listVisit.add(item.outletData);
      } else {
        listUnVisit.add(item.outletData);
      }
    });

    setState(() {
      visit = listVisit.length;
      unVisit = listUnVisit.length;
      total = widget.jadwal.length;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check,
                size: 35,
                color: Colors.green,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '$visit Outlet',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.clear,
                size: 35,
                color: Colors.red,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '$unVisit Outlet',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.store,
                size: 35,
                color: Colors.blue,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '$total Outlet',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
