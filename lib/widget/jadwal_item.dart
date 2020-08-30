import 'package:flutter/material.dart';
import 'package:sales_track_nex/database/nex_database.dart';

class JadwalItem extends StatelessWidget {
  final JadwalWithOutlet jadwal;

  JadwalItem({Key key, @required this.jadwal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200],
            width: 1,
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
                              '${jadwal.outletData.outletName}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ),
                        Text(
                          '${jadwal.outletData.owner}',
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
                    return jadwal.jadwalData.visit == 0
                        ? Icon(
                            Icons.clear,
                            color: Colors.red,
                            size: 20,
                          )
                        : Icon(
                            Icons.check,
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
