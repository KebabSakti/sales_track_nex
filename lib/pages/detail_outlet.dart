import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/utils/helper.dart';

class DetailOutlet extends StatelessWidget {
  final OutletData outletData;

  DetailOutlet({Key key, @required this.outletData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Detail Outlet'),
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
                    'Data Outlet',
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
                    'Barcode',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    '${outletData.barcode}',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 15),
                  Text(
                    'Nama Outlet',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    '${outletData.outletName}',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 15),
                  Text(
                    'Alamat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    '${outletData.address}',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 15),
                  Text(
                    'No. Telp',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    '${outletData.phone}',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 15),
                  Text(
                    'Pemilik',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    '${outletData.owner}',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 15),
                  Text(
                    'Latitude / Longitude',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    '${outletData.lat} / ${outletData.lng}',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 15),
                  Text(
                    'Tanggal Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    '${Helper().getFormattedDate(DateTime.parse(outletData.createdAt), mDateFormat: DateFormat('dd/MM/yyyy H:m:s'))}',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
