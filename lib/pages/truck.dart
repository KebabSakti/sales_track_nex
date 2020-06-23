import 'package:flutter/material.dart';
import 'package:sales_track_nex/data/truck_data.dart';

class Truck extends StatefulWidget {
  Truck({Key key}) : super(key: key);

  @override
  _TruckState createState() => _TruckState();
}

class _TruckState extends State<Truck> {
  int _id;
  List<TruckData> trucks = [];

  @override
  void initState() {
    //populate list with data
    for (int i = 0; i <= 20; i++) {
      trucks.add(TruckData(id: i, brand: 'Brand $i', plat: 'Plat $i'));
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih mobil'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 50.0),
        itemCount: trucks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                setState(() {
                  _id = trucks[index].id;
                });
              },
              leading: Icon(
                Icons.directions_car,
                size: 45.0,
              ),
              title: Text(trucks[index].brand),
              subtitle: Text(trucks[index].plat),
              selected: _id == trucks[index].id ? true : false,
              trailing: _id == trucks[index].id
                  ? Icon(Icons.radio_button_checked)
                  : Icon(Icons.radio_button_unchecked),
            ),
          );
        },
      ),
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
          onPressed: () {},
        ),
      ),
    );
  }
}
