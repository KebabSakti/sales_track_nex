import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/utils/helper.dart';

class DetailVisit extends StatelessWidget {
  final VisitWithOutlet visitWithOutlet;

  DetailVisit({Key key, @required this.visitWithOutlet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Detail Visit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Data Visit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Nama Outlet',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    '${visitWithOutlet.outletData.outletName}',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 15),
                  Text(
                    'Tanggal Visit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    '${Helper().getFormattedDate(DateTime.parse(visitWithOutlet.visitData.createdAt), mDateFormat: DateFormat('d-MM-yyyy h:m:s'))}',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 15),
                  Text(
                    'Toko Tutup',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    visitWithOutlet.visitData.tutup == 1 ? 'Ya' : 'Tidak',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Builder(
              builder: (context) {
                if (visitWithOutlet.visitData.orderId != null)
                  return Container(
                    width: double.infinity,
                    height: 45,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: FlatButton(
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Cek Order',
                        style: TextStyle(
                          color: Colors.grey[100],
                        ),
                      ),
                      onPressed: () {},
                    ),
                  );

                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
