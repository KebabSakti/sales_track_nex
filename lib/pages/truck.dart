import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/truck_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:toast/toast.dart';

class Truck extends StatefulWidget {
  Truck({Key key}) : super(key: key);

  @override
  _TruckState createState() => _TruckState();
}

class _TruckState extends State<Truck> {
  String _selectedId;

  @override
  void initState() {
    BlocProvider.of<TruckBloc>(context).add(GetTrucksWithStokSum());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih mobil'),
        centerTitle: true,
      ),
      body: BlocBuilder<TruckBloc, TruckState>(
        builder: (context, state) {
          Widget widget = Container(
            child: Center(
              child: Text('Data truck belum ada'),
            ),
          );

          if (state is GetTrucksLoading) {
            widget = CircularProgressIndicator();
          } else if (state is GetTrucksWithStockSumCompleted) {
            List<TrukWithStokSum> trucksWithStokSum = state.trukWithStokSum;
            widget = ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 1,
              ),
              padding: EdgeInsets.only(bottom: 50.0),
              itemCount: trucksWithStokSum.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _selectedId = trucksWithStokSum[index].trukData.trukId;
                      });
                    },
                    leading: Icon(
                      Icons.directions_car,
                      size: 45.0,
                    ),
                    title: Text(trucksWithStokSum[index].trukData.nomorPlat),
                    subtitle:
                        Text('Stok : ${trucksWithStokSum[index].stokTotal}'),
                    selected:
                        _selectedId == trucksWithStokSum[index].trukData.trukId
                            ? true
                            : false,
                    trailing:
                        _selectedId == trucksWithStokSum[index].trukData.trukId
                            ? Icon(Icons.radio_button_checked)
                            : Icon(Icons.radio_button_unchecked),
                  ),
                );
              },
            );
          } else if (state is GetTrucksError) {
            widget = Text('Data truck belum ada');
          }

          return widget;
        },
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 45.0,
        child: FlatButton(
          color: Colors.deepPurple[600],
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
            if (_selectedId != null)
              Toast.show("OKE", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
            else
              Toast.show("Pilih salah satu", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
          },
        ),
      ),
    );
  }
}
