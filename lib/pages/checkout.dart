import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/keranjang_bloc.dart';
import 'package:sales_track_nex/bloc/visit_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/model/keranjang.dart';
import 'package:sales_track_nex/utils/helper.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    KeranjangBloc keranjangBloc = BlocProvider.of<KeranjangBloc>(context);

    keranjangBloc.add(SetNomorPo());

    List<Widget> widgets = [
      CheckoutHeader(),
      SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Orderan',
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            GestureDetector(
              child: Text(
                'Edit',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      Divider(),
    ];

    keranjangBloc.state.keranjangDetail.keranjangData.forEach((key, value) {
      KeranjangData keranjangData =
          keranjangBloc.state.keranjangDetail.keranjangData[key];
      ProdukData produkData = keranjangData.produkData;

      widgets.add(Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${produkData.nama}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 2),
              Text(
                '${Helper().getFormattedNumber(double.parse(produkData.harga))}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          trailing: Container(
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'x ${keranjangData.qty}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  '${Helper().getFormattedNumber(keranjangData.total)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    });

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              CheckoutHeader(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Orderan',
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Edit',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var keranjang =
                    keranjangBloc.state.keranjangDetail.keranjangData;
                var key = keranjang.keys.elementAt(index);
                var produkData = keranjang[key].produkData;
                var keranjangData = keranjang[key];

                return Card(
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${produkData.nama}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '${Helper().getFormattedNumber(double.parse(produkData.harga))}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'x ${keranjangData.qty}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                            ),
                          ),
                          Text(
                            '${Helper().getFormattedNumber(keranjangData.total)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount:
                  keranjangBloc.state.keranjangDetail.keranjangData.length,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 140,
            ),
          )
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 130,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(color: Colors.grey[100]))),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          '${keranjangBloc.state.keranjangDetail.keranjangData.length} produk',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '${Helper().getFormattedNumber(keranjangBloc.state.keranjangDetail.sum)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              child: FlatButton(
                color: Colors.deepPurple[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Text(
                  'Buat Orderan',
                  style: TextStyle(
                    color: Colors.grey[100],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName('/visit'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    KeranjangBloc keranjangBloc = BlocProvider.of<KeranjangBloc>(context);
    // ignore: close_sinks
    VisitBloc visitBloc = BlocProvider.of<VisitBloc>(context);

    return Container(
      height: 220,
      child: Stack(
        children: <Widget>[
          Container(
            height: 198,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple[600], Colors.deepPurple[700]],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Text(
                    '${visitBloc.state.outletData.outletName}',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[100],
                    ),
                  ),
                ),
                BlocBuilder<KeranjangBloc, KeranjangState>(
                  builder: (context, state) {
                    return Text(
                      '#${keranjangBloc.state.keranjangDetail.nomorPo}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.amberAccent,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ToggleJenisPembayaran(),
          ),
//          Align(
//            alignment: Alignment.topLeft,
//            child: SafeArea(
//              child: Padding(
//                padding: EdgeInsets.only(left: 15, top: 15),
//                child: GestureDetector(
//                  child: Icon(
//                    Icons.arrow_back,
//                    color: Colors.white,
//                    size: 25,
//                  ),
//                  onTap: () {
//                    Navigator.of(context).pop();
//                  },
//                ),
//              ),
//            ),
//          ),
        ],
      ),
    );
  }
}

class ToggleJenisPembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    KeranjangBloc keranjangBloc = BlocProvider.of(context);

    print('Jenis Pembayaran ${keranjangBloc.state.keranjangDetail.pembayaran}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BlocBuilder<KeranjangBloc, KeranjangState>(
          builder: (context, state) {
            Widget widget = FlatButton(
              color: state.keranjangDetail.pembayaran == 'Cash'
                  ? Colors.blueAccent
                  : Colors.grey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Container(
                height: 50,
                width: 100,
                child: Center(
                  child: Text(
                    'CASH',
                    style: TextStyle(
                      color: state.keranjangDetail.pembayaran == 'Cash'
                          ? Colors.white
                          : Colors.grey[800],
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                keranjangBloc.add(SetPembayaran('Cash'));
              },
            );

            if (state is KeranjangStatus) {
              print(state.keranjangDetail.pembayaran);
              return widget;
            }

            return widget;
          },
        ),
        BlocBuilder<KeranjangBloc, KeranjangState>(
          builder: (context, state) {
            Widget widget = FlatButton(
              color: state.keranjangDetail.pembayaran == 'Kredit'
                  ? Colors.blueAccent
                  : Colors.grey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                height: 50,
                width: 100,
                child: Center(
                  child: Text(
                    'KREDIT',
                    style: TextStyle(
                      color: state.keranjangDetail.pembayaran == 'Kredit'
                          ? Colors.white
                          : Colors.grey[800],
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                keranjangBloc.add(SetPembayaran('Kredit'));
              },
            );

            if (state is KeranjangStatus) return widget;

            return widget;
          },
        ),
      ],
    );
  }
}

//class ToggleJenisPembayaran extends StatefulWidget {
//  const ToggleJenisPembayaran({Key key, this.onChangeJenisPembayaran})
//      : super(key: key);
//
//  final ValueChanged<String> onChangeJenisPembayaran;
//
//  @override
//  _ToggleJenisPembayaranState createState() => _ToggleJenisPembayaranState();
//}
//
//class _ToggleJenisPembayaranState extends State<ToggleJenisPembayaran> {
//  String _jenisBayar = 'CASH';
//
//  _setJenisPembayaran(String value) {
//    setState(() {
//      _jenisBayar = value;
//      widget.onChangeJenisPembayaran(value);
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        FlatButton(
//          color: _jenisBayar == 'CASH' ? Colors.blueAccent : Colors.grey[400],
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(20),
//              bottomLeft: Radius.circular(20),
//            ),
//          ),
//          child: Container(
//            height: 50,
//            width: 100,
//            child: Center(
//              child: Text(
//                'CASH',
//                style: TextStyle(
//                  color:
//                      _jenisBayar == 'CASH' ? Colors.white : Colors.grey[800],
//                  fontSize: 20,
//                ),
//              ),
//            ),
//          ),
//          onPressed: () {
//            setState(() {
//              _jenisBayar = 'CASH';
//            });
//          },
//        ),
//        FlatButton(
//          color: _jenisBayar == 'KREDIT' ? Colors.blueAccent : Colors.grey[100],
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.only(
//              topRight: Radius.circular(20),
//              bottomRight: Radius.circular(20),
//            ),
//          ),
//          child: Container(
//            height: 50,
//            width: 100,
//            child: Center(
//              child: Text(
//                'KREDIT',
//                style: TextStyle(
//                  color:
//                      _jenisBayar == 'KREDIT' ? Colors.white : Colors.grey[800],
//                  fontSize: 20,
//                ),
//              ),
//            ),
//          ),
//          onPressed: () {
//            _setJenisPembayaran('KREDIT');
//          },
//        )
//      ],
//    );
//  }
//}
