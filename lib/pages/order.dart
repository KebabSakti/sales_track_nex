import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/list_order_bloc.dart';
import 'package:sales_track_nex/utils/helper.dart';
import 'package:sales_track_nex/widget/search_and_periode.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  // ignore: close_sinks
  AuthenticateBloc authenticateBloc;
  // ignore: close_sinks
  ListOrderBloc listOrderBloc;

  DateTime _periodeAwal = Helper().getPeriode()[0];
  DateTime _periodeAkhir = Helper().getPeriode()[1];
  String _searchKeyword = '';

  void _onSearchFieldChangedListener(value) {
    _searchKeyword = value;

    _fetchData();
  }

  void _onPeriodeChangedListener(periode) {
    _periodeAwal = periode[0];
    _periodeAkhir = periode[1];

    _fetchData();
  }

  Future<void> _fetchData() async {
    listOrderBloc.add(FetchOrder(
      _periodeAwal.toIso8601String(),
      _periodeAkhir.toIso8601String(),
      authenticateBloc.state.user,
      _searchKeyword,
    ));
  }

  @override
  void initState() {
    authenticateBloc = BlocProvider.of<AuthenticateBloc>(context);
    listOrderBloc = BlocProvider.of<ListOrderBloc>(context);

    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text('Keluar dari aplikasi?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Tidak'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  FlatButton(
                    child: Text('Ya'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              ),
            ) ??
            false;
      },
      child: RefreshIndicator(
        onRefresh: _fetchData,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Order'),
          ),
          body: Column(
            children: <Widget>[
              SearchPeriode(
                onSearchFieldChanged: _onSearchFieldChangedListener,
                onPeriodeChanged: _onPeriodeChangedListener,
              ),
              SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<ListOrderBloc, ListOrderState>(
                  builder: (context, state) {
                    if (state is FetchOrderComplete) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          var order = state.order[index];

                          return Card(
                            elevation: 0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            margin: EdgeInsets.zero,
                            child: ListTile(
                              contentPadding: EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                left: 15,
                                right: 15,
                              ),
                              leading: CircleAvatar(
                                backgroundColor:
                                    order.orderData.nomorFaktur != null
                                        ? Colors.green
                                        : Colors.blueAccent,
                                child: order.orderData.nomorFaktur != null
                                    ? Text(
                                        'FT',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        'PO',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                              title: Text(
                                '${order.outletData.outletName}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[800],
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${order.orderData.pembayaran}',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    '${Helper().getFormattedNumber(double.parse(order.orderData.totalBayar))}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Text(
                                '${Helper().getFormattedDate(DateTime.parse(order.orderData.updatedAt), mDateFormat: DateFormat('d MMM'))}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[800],
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed('/detail_order',
                                    arguments: order);
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          height: 1,
                        ),
                        itemCount: state.order.length,
                      );
                    } else if (state is FetchOrderError) {
                      return Center(
                        child: Text(
                          'Tidak ada data',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
