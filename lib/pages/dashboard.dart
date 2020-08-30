import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/jadwal_bloc.dart';
import 'package:sales_track_nex/bloc/navigation_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/widget/jadwal_item.dart';
import 'package:shimmer/shimmer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
    return WillPopScope(
      onWillPop: () async {
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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: _fetchJadwal,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: DashboardHeader(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
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
        ),
      ),
    );
  }
}

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285.0,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.deepPurple[600],
        gradient: LinearGradient(
          colors: [Colors.deepPurple[600], Colors.deepPurple[700]],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 70.0),
          Image.asset(
            'assets/images/aice.png',
            width: 100.0,
          ),
          SizedBox(height: 50.0),
          Container(
            height: 90.0,
            width: double.infinity,
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: BlocBuilder<AuthenticateBloc, AuthenticateState>(
              builder: (context, state) {
                if (state is GetUserLocalCompleted) {
                  print(state.user.type);
                  return DashboardMainMenu(user: state.user);
                }

                return DashboardMainMenuShimmer();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardMainMenuShimmer extends StatelessWidget {
  const DashboardMainMenuShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        DashboardMainMenuItemShimmer(),
        DashboardMainMenuItemShimmer(),
        DashboardMainMenuItemShimmer(),
      ],
    );
  }
}

class DashboardMainMenuItemShimmer extends StatelessWidget {
  const DashboardMainMenuItemShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 35.0,
            height: 35.0,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Material(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          SizedBox(height: 6),
          SizedBox(
            width: 35.0,
            height: 12.0,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Material(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardMainMenu extends StatelessWidget {
  const DashboardMainMenu({
    Key key,
    this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Builder(
          builder: (context) {
            if (user.type == 'Sales') {
              return FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/tambah_outlet');
                },
                shape: CircleBorder(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add_circle,
                      size: 35,
                      color: Colors.green,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Add Outlet',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return FlatButton(
                onPressed: () {},
                shape: CircleBorder(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.directions_car,
                      size: 35,
                      color: Colors.green,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Stok',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/visit');
          },
          shape: CircleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 35,
                color: Colors.red,
              ),
              SizedBox(height: 4),
              Text(
                'Visit Outlet',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        FlatButton(
          onPressed: () {},
          shape: CircleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.cloud_upload,
                size: 35,
                color: Colors.blue,
              ),
              SizedBox(height: 4),
              Text(
                'Data',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    FlatButton(
//                      onPressed: () {},
//                      shape: CircleBorder(),
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Icon(
//                          Icons.add_circle,
//                          size: 40,
//                          color: Colors.green,
//                        ),
//                      ),
//                    ),
//                    Text(
//                      'Add Outlet',
//                      style: TextStyle(
//                        fontSize: 10,
//                      ),
//                    ),
//                  ],
//                ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    FlatButton(
//                      onPressed: () {},
//                      shape: CircleBorder(),
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Icon(
//                          Icons.location_on,
//                          size: 40,
//                          color: Colors.red,
//                        ),
//                      ),
//                    ),
//                    Text(
//                      'Visit Outlet',
//                      style: TextStyle(
//                        fontSize: 10,
//                      ),
//                    ),
//                  ],
//                ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    FlatButton(
//                      onPressed: () {},
//                      shape: CircleBorder(),
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Icon(
//                          Icons.cloud_upload,
//                          size: 40,
//                          color: Colors.blue,
//                        ),
//                      ),
//                    ),
//                    Text(
//                      'Data',
//                      style: TextStyle(
//                        fontSize: 10,
//                      ),
//                    ),
//                  ],
//                ),
      ],
    );
  }
}

void _logout(value, BuildContext context) {
  BlocProvider.of<NavigationBloc>(context).add(NavigateLogout());
}
