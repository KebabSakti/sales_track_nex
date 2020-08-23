import 'package:flutter/material.dart';
import 'package:sales_track_nex/model/jadwal_item_model.dart';

class JadwalItem extends StatelessWidget {
  const JadwalItem({
    Key key,
    @required this.jadwalItemModel,
  }) : super(key: key);

  final JadwalItemModel jadwalItemModel;

  @override
  Widget build(BuildContext context) {
    return Material(
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
                            '${jadwalItemModel.outletName}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      Text(
                        'di visit 0 hari lalu',
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
                  return jadwalItemModel.visitStatus == 0
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
    );
  }
}
