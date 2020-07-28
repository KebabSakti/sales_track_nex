import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/navigation_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> outlet = [];

    for (int i = 1; i <= 100; i++) {
      outlet.add("Toko Kebab Keren Murah Meriah $i");
    }

    List<Widget> widgets = [
      DashboardHeader(),
      SizedBox(height: 15.0),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Jadwal Kunjungan",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ),
      ),
      SizedBox(height: 10.0),
    ];

    for (int i = 1; i <= 100; i++) {
      widgets.add(OutletItem(outlet: "Toko Kebab Keren Murah Meriah $i"));
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: widgets.toList(),
      ),
    );
  }
}

class OutletItemShimmer extends StatelessWidget {
  const OutletItemShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 80.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Material(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 14.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Material(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
                SizedBox(height: 4.0),
                Container(
                  width: 100.0,
                  height: 10.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Material(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Material(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OutletItem extends StatelessWidget {
  const OutletItem({Key key, @required this.outlet}) : super(key: key);

  final String outlet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Material(
              color: Colors.white, // button color
              child: SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.store,
                  color: Colors.blue,
                  size: 25.0,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  outlet,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  "di visit beberapa hari yang lalu",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20.0),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 20.0,
                ),
                SizedBox(height: 5.0),
                Text(
                  " m",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    Key key,
    @required this.outlet,
  }) : super(key: key);

  final List<String> outlet;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 60, top: 5),
      itemCount: outlet.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 15.0, left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  child: InkWell(
                    splashColor: Colors.purple[100], // inkwell color
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.store,
                        color: Colors.blue,
                        size: 25.0,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      outlet[index],
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "di visit $index hari yang lalu",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 20.0,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "$index m",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 40.0, right: 15.0),
              child: ClipOval(
                child: Material(
                  color: Colors.deepPurple, // button color
                  child: InkWell(
                    splashColor: Colors.purple[100], // inkwell color
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: PopupMenuButton(
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 14,
                              ),
                            ),
                            value: 1,
                            height: 10,
                          ),
                        ],
                        tooltip: "Sentuh untuk logout",
                        onSelected: (value) {
                          _logout(value, context);
                        },
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/images/aice.png',
            width: 100.0,
          ),
          SizedBox(height: 15.0),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Outlet Terdekat",
                style: TextStyle(
                  color: Colors.grey[100],
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 90.0,
            width: double.infinity,
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: _outletTerdekatState(),
          ),
        ],
      ),
    );
  }

  _outletTerdekatState() {
    return OutletTerdekatAktif();
  }
}

class OutletTerdekatAktif extends StatelessWidget {
  const OutletTerdekatAktif({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 80.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.red,
                size: 30.0,
              ),
              SizedBox(height: 5.0),
              Text(
                "1 m",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Toko Kebab Sakti",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "di visit 2 hari yang lalu",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15.0),
          child: ClipOval(
            child: Material(
              color: Colors.blue[600], // button color
              child: InkWell(
                splashColor: Colors.blue[100], // inkwell color
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 15.0,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OutletJadwalLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 56),
      child: Column(
        children: <Widget>[
          OutletItemShimmer(),
          SizedBox(height: 20.0),
          OutletItemShimmer(),
          SizedBox(height: 20.0),
          OutletItemShimmer(),
          SizedBox(height: 20.0),
          OutletItemShimmer(),
          SizedBox(height: 20.0)
        ],
      ),
    );
  }
}

void _logout(value, BuildContext context) {
  BlocProvider.of<NavigationBloc>(context).add(NavigateLogout());
}
