import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/pages/jadwal.dart';
import 'package:sales_track_nex/pages/list_outlet.dart';
import 'package:sales_track_nex/pages/list_visit.dart';

class Outlet extends StatefulWidget {
  @override
  _OutletState createState() => _OutletState();
}

class _OutletState extends State<Outlet> {
  ScrollController _jadwalScrollControler = ScrollController();
  List<Widget> jadwal = [
    Container(
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
                Icons.check_circle,
                size: 35,
                color: Colors.green,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '4 Outlet',
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
                Icons.remove_circle,
                size: 35,
                color: Colors.red,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '2 Outlet',
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
                '6 Outlet',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              )
            ],
          ),
        ],
      ),
    ),
    SizedBox(height: 10),
  ];

  _addJadwalOutlet() {
    for (int i = 0; i <= 20; i++) {
      setState(() {
        jadwal.add(
          JadwalItem(i: i),
        );
      });
    }
  }

  _fetchMoreJadwal() {
    setState(() {
      jadwal.add(
        JadwalItem(i: 21),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _addJadwalOutlet();
//    var triggerFetchMoreJadwal =
//        0.7 * _jadwalScrollControler.position.maxScrollExtent;

    _jadwalScrollControler.addListener(() {
      if (_jadwalScrollControler.position.pixels ==
          _jadwalScrollControler.position.maxScrollExtent) _fetchMoreJadwal();
    });
  }

  @override
  void dispose() {
    _jadwalScrollControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text('Keluar dari aplikasi?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Tidak'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  FlatButton(
                    child: Text('Ya'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              ),
            ) ??
            false;
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Outlet'),
            centerTitle: true,
            actions: <Widget>[
              BlocBuilder<AuthenticateBloc, AuthenticateState>(
                builder: (context, state) {
                  return PopupMenuButton(
                    icon: Icon(Icons.add),
                    onSelected: (value) async {
                      if (value == 1) {
                        Navigator.of(context).pushNamed('/tambah_outlet');
                      } else if (value == 2) {
                        Navigator.of(context).pushNamed('/visit');
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 1,
                        height: 10,
                        child: Text('Tambah Outlet'),
                        enabled: state.user.type == 'Delivery' ? false : true,
                      ),
                      PopupMenuItem(
                        value: 2,
                        height: 10,
                        child: Text('Visit Outlet'),
                      ),
                    ],
                  );
                },
              ),
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Jadwal',
                ),
                Tab(
                  text: 'Visit',
                ),
                Tab(
                  text: 'Outlet',
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[Jadwal(), ListVisit(), ListOutlet(),],
          ),
        ),
      ),
    );
  }
}

class JadwalItem extends StatelessWidget {
  const JadwalItem({
    Key key,
    @required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200],
            width: i != 20 ? 1.0 : 0.0,
          ),
        ),
      ),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.grey[100], // button color
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.store,
                            color: Colors.blue,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Builder(
                          builder: (context) => Container(
                            width: MediaQuery.of(context).size.width - 150,
                            child: Text(
                              'tk kebab sakti $i',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ),
                        Text(
                          'di visit $i hari lalu',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Builder(
                  builder: (context) {
                    return i == 2
                        ? Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                            size: 20,
                          )
                        : Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
