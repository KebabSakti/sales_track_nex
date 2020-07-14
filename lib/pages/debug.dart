import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;
import 'package:sales_track_nex/bloc/sync_outlet_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/database/relation/truk_with_stok.dart';

class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final database = BlocProvider.of<SingletonBloc>(context).database;

    return Scaffold(
      appBar: AppBar(
        title: Text("Debug Page"),
      ),
      body: DebugTwo(),
    );
  }
}

class DebugTwo extends StatefulWidget {
  const DebugTwo({Key key});

  @override
  _DebugTwoState createState() => _DebugTwoState();
}

class _DebugTwoState extends State<DebugTwo> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SyncOutletBloc>(context).add(DeleteAllOutlet());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Container(
        // Another fixed-height child.
        color: const Color(0xff008000), // Green
        height: 120.0,
        alignment: Alignment.center,
        child: const Text('Fixed Height Content'),
      ),
      Container(
        // Another fixed-height child.
        color: const Color(0xff008000), // Green
        height: 120.0,
        alignment: Alignment.center,
        child: const Text('Fixed Height Content'),
      ),
      Container(
        // Another fixed-height child.
        color: const Color(0xff008000), // Green
        height: 120.0,
        alignment: Alignment.center,
        child: const Text('Fixed Height Content'),
      ),
      Container(
        // Another fixed-height child.
        color: const Color(0xff008000), // Green
        height: 120.0,
        alignment: Alignment.center,
        child: const Text('Fixed Height Content'),
      ),
      Container(
        // Another fixed-height child.
        color: Colors.purple, // Green
        height: 120.0,
        alignment: Alignment.center,
        child: const Text('Fixed Height Content'),
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 56.0),
      child: Column(
        children: <Widget>[
          Container(
            // A fixed-height child.
            color: const Color(0xffeeee00), // Yellow
            height: 120.0,
            alignment: Alignment.center,
            child: const Text('Fixed Height Content'),
          ),
          Container(
            // Another fixed-height child.
            color: const Color(0xff008000), // Green
            height: 120.0,
            alignment: Alignment.center,
            child: const Text('Fixed Height Content'),
          ),
          Column(
            children: widgets.toList(),
          ),
        ],
      ),
    );
  }
}

class DebugOne extends StatelessWidget {
  const DebugOne({
    Key key,
    @required this.database,
  }) : super(key: key);

  final NexDatabase database;

  @override
  Widget build(BuildContext context) {
    StreamBuilder<List<TrukWithStok>> _buildTrukWithStokList(
        BuildContext context, NexDatabase database) {
      return StreamBuilder(
        stream: database.trukDao.getTrukWithStok(),
        builder: (context, snapshot) {
          final truk = snapshot.data ?? List();

          return ListView.builder(
            itemCount: truk.length,
            itemBuilder: (_, index) {
              final item = truk[index];
              print(item.stok);

              return Card(
                child: ListTile(
                  contentPadding: EdgeInsets.all(5.0),
                  title: Text(item.truk.nomorPlat),
                  // subtitle: Text(item.stok.nama_produk),
                ),
              );
            },
          );
        },
      );
    }

    return Container(
      // padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("Truk"),
                onPressed: () async {
                  //tambah data truk
                  // var trukId = await database.trukDao.insertTruk(
                  //   TrukCompanion(
                  //     id: moor.Value.absent(),
                  //     brand: moor.Value("Suzuki"),
                  //     nomor_plat: moor.Value(
                  //         "KT ${Random().nextInt(100).toString()} NA"),
                  //     created_at: moor.Value(DateTime.now()),
                  //     updated_at: moor.Value(DateTime.now()),
                  //     sync_date: moor.Value(DateTime.now()),
                  //   ),
                  // );

                  //tambah produk ke truk
                  await database.stokDao.insertStok(
                    StokCompanion(
                      userId: moor.Value(1),
                      trukId: moor.Value(1),
                      namaProduk: moor.Value(
                          "Produk ${Random().nextInt(100).toString()}"),
                      quantity: moor.Value(Random().nextInt(999)),
                      createdAt: moor.Value(DateTime.now()),
                      updatedAt: moor.Value(DateTime.now()),
                    ),
                  );

                  // //tambah produk ke truk
                  // await database.stokDao.insertStok(
                  //   StokCompanion(
                  //     user_id: moor.Value(1),
                  //     truck_id: moor.Value(trukId),
                  //     nama_produk: moor.Value(
                  //         "Produk ${Random().nextInt(100).toString()}"),
                  //     quantity: moor.Value(Random().nextInt(999)),
                  //     created_at: moor.Value(DateTime.now()),
                  //     updated_at: moor.Value(DateTime.now()),
                  //   ),
                  // );
                },
              ),
              // RaisedButton(
              //   child: Text("Stok"),
              //   onPressed: () async {
              //     //tambah produk ke truk
              //     await database.stokDao.insertStok(
              //       StokCompanion(
              //         user_id: moor.Value(1),
              //         truck_id: moor.Value(1),
              //         nama_produk: moor.Value(
              //             "Produk ${Random().nextInt(100).toString()}"),
              //         quantity: moor.Value(Random().nextInt(999)),
              //         created_at: moor.Value(DateTime.now()),
              //         updated_at: moor.Value(DateTime.now()),
              //       ),
              //     );
              //   },
              // ),
              RaisedButton(
                child: Text("GO"),
                onPressed: () {
                  var trukWithStok = database.trukDao.getTrukWithStok();

                  trukWithStok.listen((event) {
                    for (var item in event) {
                      // print(item.truk.nomor_plat);
                      print(item.truk.id);
                    }
                  });
                },
              ),
              RaisedButton(
                child: Text("X"),
                onPressed: () async {
                  await database.trukDao.deleteTruk();
                  await database.stokDao.deleteStok();
                },
              ),
            ],
          ),
          Expanded(
            child: _buildTrukWithStokList(context, database),
          ),
        ],
      ),
    );
  }
}
