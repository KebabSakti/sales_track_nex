import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/detail_order_bloc.dart';
import 'package:sales_track_nex/bloc/keranjang_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/utils/helper.dart';
import 'package:toast/toast.dart';

class DetailOrder extends StatefulWidget {
  final OrderWithOutlet orderWithOutlet;

  DetailOrder({Key key, @required this.orderWithOutlet}) : super(key: key);

  @override
  _DetailOrderState createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  double totalOrder = 0;

  // ignore: close_sinks
  AuthenticateBloc authenticateBloc;
  DetailOrderBloc detailOrderBloc;
  KeranjangBloc keranjangBloc;

  Future<void> _refreshPage() async {
    detailOrderBloc.add(GetOrderItemData(widget.orderWithOutlet, context));
  }

  @override
  void initState() {
    authenticateBloc = BlocProvider.of<AuthenticateBloc>(context);
    detailOrderBloc = BlocProvider.of<DetailOrderBloc>(context);
    keranjangBloc = BlocProvider.of<KeranjangBloc>(context);

    _refreshPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (totalOrder !=
            double.parse(widget.orderWithOutlet.orderData.totalBayar)) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text('Perubahan belum di simpan, lanjutkan?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Tidak'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Ya'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();

                    keranjangBloc.add(Resetkeranjang());
                  },
                ),
              ],
            ),
          );

          return false;
        } else {
          keranjangBloc.add(Resetkeranjang());

          return true;
        }
      },
      child: RefreshIndicator(
        onRefresh: _refreshPage,
        child: MultiBlocListener(
          listeners: [
            BlocListener<KeranjangBloc, KeranjangState>(
              listener: (context, state) =>
                  totalOrder = state.keranjangDetail.sum,
            ),
            BlocListener<DetailOrderBloc, DetailOrderState>(
              listener: (context, state) {
                if (state is SubmitFakturComplete)
                  keranjangBloc.add(Resetkeranjang());

                Toast.show(
                  'Faktur berhasil di buat',
                  context,
                  duration: 2,
                  gravity: Toast.CENTER,
                );

                Navigator.of(context).pop();
              },
            ),
          ],
          child: Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(title: Text('Detail Order')),
                SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Data Outlet',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            Divider(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Nama Outlet',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  '${widget.orderWithOutlet.outletData.outletName}',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Pemilik',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  '${widget.orderWithOutlet.outletData.owner}',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'No. Telp',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  '${widget.orderWithOutlet.outletData.phone}',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Data Order',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            Divider(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'No PO',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  '${widget.orderWithOutlet.orderData.nomorPO}',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'No Faktur',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  widget.orderWithOutlet.orderData
                                          .nomorFaktur ??
                                      '-',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Pembayaran',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  '${widget.orderWithOutlet.orderData.pembayaran}',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Tgl. Order',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  '${Helper().getFormattedDate(DateTime.parse(widget.orderWithOutlet.orderData.updatedAt), mDateFormat: DateFormat('d MMM y'))}',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Item',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (widget.orderWithOutlet.orderData
                                        .nomorFaktur ==
                                    null) {
                                  return GestureDetector(
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          '/order_product',
                                          arguments: true);
                                    },
                                  );
                                }

                                return SizedBox.shrink();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(height: 1),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<KeranjangBloc, KeranjangState>(
                  builder: (context, state) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext contex, int index) {
                          var keranjang = state.keranjangDetail.keranjangData;
                          var key = keranjang.keys.elementAt(index);
                          var produkData = keranjang[key].produkData;
                          var keranjangData = keranjang[key];

                          return Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${produkData.nama}',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          '${Helper().getFormattedNumber(double.parse(produkData.harga))}',
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 110,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'x ${keranjangData.qty}',
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '${Helper().getFormattedNumber(keranjangData.total)}',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: state.keranjangDetail.keranjangData.length,
                      ),
                    );
                  },
                ),
                BlocBuilder<KeranjangBloc, KeranjangState>(
                  builder: (context, state) {
                    return SliverToBoxAdapter(
                      child: Container(
                        width: double.infinity,
                        height: 130,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey[100]))),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15, bottom: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                            Builder(
                              builder: (context) {
                                if (widget.orderWithOutlet.orderData
                                        .nomorFaktur ==
                                    null) {
                                  return Container(
                                    width: double.infinity,
                                    height: 45,
                                    child: FlatButton(
                                      color: Colors.deepPurple[600],
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Text(
                                        'Buat Faktur',
                                        style: TextStyle(
                                          color: Colors.grey[100],
                                        ),
                                      ),
                                      onPressed: () {
                                        detailOrderBloc.add(SubmitFaktur(
                                          keranjangBloc.state.keranjangDetail,
                                          widget.orderWithOutlet.orderData,
                                          context,
                                          authenticateBloc.state.user,
                                        ));
                                      },
                                    ),
                                  );
                                }

                                return SizedBox.shrink();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
