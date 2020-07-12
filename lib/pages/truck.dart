import 'package:flutter/material.dart';
import 'package:sales_track_nex/database/nex_database.dart';

class Truck extends StatefulWidget {
  Truck({Key key}) : super(key: key);

  @override
  _TruckState createState() => _TruckState();
}

class _TruckState extends State<Truck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih mobil'),
        centerTitle: true,
      ),
      // body: ListView.builder(
      //   padding: EdgeInsets.only(bottom: 50.0),
      //   itemCount: 0,
      //   itemBuilder: (context, index) {
      //     return Card(
      //       child: ListTile(
      //         onTap: () {},
      //         leading: Icon(
      //           Icons.directions_car,
      //           size: 45.0,
      //         ),
      //         title: Text(trucks[index].brand),
      //         subtitle: Text(trucks[index].plat),
      //         selected: _id == trucks[index].id ? true : false,
      //         trailing: _id == trucks[index].id
      //             ? Icon(Icons.radio_button_checked)
      //             : Icon(Icons.radio_button_unchecked),20
      //       ),
      //     );
      //   },
      // ),
      bottomSheet: Container(
        width: double.infinity,
        height: 45.0,
        child: FlatButton(
          color: Colors.blue[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Text(
            'Simpan',
            style: TextStyle(
              color: Colors.grey[100],
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/debug', (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }
}
