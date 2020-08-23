import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/keranjang_bloc.dart';
import 'package:sales_track_nex/bloc/order_product_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/model/keranjang.dart';
import 'package:sales_track_nex/utils/helper.dart';
import 'package:toast/toast.dart';

class OrderProduct extends StatefulWidget {
  @override
  _OrderProductState createState() => _OrderProductState();
}

class _OrderProductState extends State<OrderProduct> {
  TextEditingController _searchText = TextEditingController();

  _getProduct(String keyword, {int limit, int offset}) {
    BlocProvider.of<OrderProductBloc>(context)
        .add(GetOrderProduct(keyword, limit: limit, offset: offset));
  }

  _searchBarChangedListener(value) {
    _getProduct(value);
  }

  @override
  void initState() {
    //list all product
    _getProduct('');
    super.initState();
  }

  @override
  void dispose() {
    _searchText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<KeranjangBloc, KeranjangState>(
          listener: (context, state) {
            print(state);
            if (state is KeranjangStatus) print(state.keranjangDetail.sum);
          },
        ),
      ],
      child: Scaffold(
        appBar: OrderProductAppbar(
          onChanged: _searchBarChangedListener,
        ),
        body: BlocBuilder<OrderProductBloc, OrderProductState>(
          builder: (context, state) {
            if (state is GetOrderProductComplete) {
              return ListView.separated(
                padding: EdgeInsets.only(bottom: 45),
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final keranjang = BlocProvider.of<KeranjangBloc>(context)
                      .state
                      .keranjangDetail
                      ?.keranjangData;
                  var produkItem = state.product[index];

                  return Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: ListTile(
                      leading: ClipOval(
                        child: Material(
                          color: Colors.grey[100], // button color
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.fastfood,
                              color: Colors.amberAccent,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${produkItem.nama}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 2),
                          BlocBuilder<KeranjangBloc, KeranjangState>(
                            builder: (context, state) {
                              if (state is KeranjangStatus) {
                                if (state.keranjangDetail.keranjangData
                                    .containsKey(produkItem.produkId))
                                  return Text(
                                    'Stok : ${produkItem.stok - state.keranjangDetail.keranjangData[produkItem.produkId].qty}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[400],
                                    ),
                                  );
                                else
                                  return Text(
                                    'Stok : ${produkItem.stok}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[400],
                                    ),
                                  );
                              } else {
                                if (keranjang.containsKey(produkItem.produkId))
                                  return Text(
                                    'Stok : ${produkItem.stok - keranjang[produkItem.produkId].qty}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[400],
                                    ),
                                  );
                                else
                                  return Text(
                                    'Stok : ${produkItem.stok}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[400],
                                    ),
                                  );
                              }
                            },
                          ),
                        ],
                      ),
                      trailing: Container(
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BlocBuilder<KeranjangBloc, KeranjangState>(
                              builder: (context, state) {
                                if (state is KeranjangStatus) if (state
                                    .keranjangDetail.keranjangData
                                    .containsKey(produkItem.produkId)) {
                                  return Text(
                                    'x ${state.keranjangDetail.keranjangData[produkItem.produkId].qty}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[800],
                                    ),
                                  );
                                } else {
                                  return Text(
                                    'x 0',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[800],
                                    ),
                                  );
                                }
                                else
                                  return Text(
                                    'x 0',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[800],
                                    ),
                                  );
                              },
                            ),
                            Text(
                              '${Helper().getFormattedNumber(double.parse(produkItem.harga))}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return ProdukQty(
                              produkData: produkItem,
                              state:
                                  BlocProvider.of<KeranjangBloc>(context).state,
                            );
                          },
                        );
                      },
                    ),
                  );
                },
                itemCount: state.product.length,
              );
            } else if (state is GetOrderProductLoading) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is GetOrderProductError) {
              return Container(
                child: Center(
                  child: Text(
                    'Produk tidak ditemukan',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: Text(
                    'Belum ada produk pada database',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              );
            }
          },
        ),
        bottomSheet: Container(
          width: double.infinity,
          height: 45.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 45,
                  padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                    child: BlocBuilder<KeranjangBloc, KeranjangState>(
                      builder: (context, state) {
                        if (state is KeranjangStatus)
                          return Text(
                            '${Helper().getFormattedNumber(state.keranjangDetail?.sum)}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          );
                        else
                          return Text(
                            'Rp 0,00',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 45,
                  child: FlatButton(
                    color: Colors.deepPurple[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.grey[100],
                      ),
                    ),
                    onPressed: () {
                      if (BlocProvider.of<KeranjangBloc>(context)
                              .state
                              .keranjangDetail
                              .sum >
                          0)
                        Navigator.of(context).pushNamed('/checkout');
                      else
                        Toast.show('Belum ada produk di tambahkan', context,
                            gravity: Toast.CENTER);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProdukQty extends StatefulWidget {
  ProdukQty({Key key, @required this.produkData, @required this.state})
      : super(key: key);

  final ProdukData produkData;
  final KeranjangState state;

  @override
  _ProdukQtyState createState() => _ProdukQtyState();
}

class _ProdukQtyState extends State<ProdukQty> {
  int _qty = 0;
  double _total = 0;
  int _stok = 0;

  void _tambahQty(harga) {
    int qty = _qty + 1;

    if (_stok > 0) {
      setState(() {
        _qty = qty;
        _total = qty * harga;
        _stok -= 1;
      });

      BlocProvider.of<KeranjangBloc>(context).add(AddItem(KeranjangData(
          produkData: widget.produkData, qty: _qty, total: _total)));
    }
  }

  void _kurangiQty(harga) {
    int qty = _qty - 1;

    if (qty >= 0) {
      setState(() {
        _qty = qty;
        _total = qty * harga;
        _stok += 1;
      });

      BlocProvider.of<KeranjangBloc>(context).add(AddItem(KeranjangData(
          produkData: widget.produkData, qty: _qty, total: _total)));
    }
  }

  @override
  void initState() {
    setState(() {
      if (widget.state.keranjangDetail.keranjangData
          .containsKey(widget.produkData.produkId))
        _qty = widget.state.keranjangDetail
            ?.keranjangData[widget.produkData.produkId].qty;

      _stok = widget.produkData.stok - _qty;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                '${widget.produkData.nama}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Stok : $_stok',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 30,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      color: Colors.red[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.6),
                      ),
                      child: Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        _kurangiQty(double.parse(widget.produkData.harga));
                      },
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    color: Colors.grey[200],
                    child: Center(
                      child: Text('$_qty'),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      color: Colors.green[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.6),
                      ),
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        _tambahQty(double.parse(widget.produkData.harga));
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                '${Helper().getFormattedNumber(_total)}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderProductAppbar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String> onChanged;

  OrderProductAppbar({Key key, @required this.onChanged}) : super(key: key);

  @override
  _OrderProductAppbarState createState() => _OrderProductAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _OrderProductAppbarState extends State<OrderProductAppbar> {
  TextEditingController _searchText = TextEditingController();
  bool _toggleSearchBar = false;
  bool _toggleClearText = false;

  _searchTextChangeListener() {
    setState(() {
      if (_searchText.text.length > 0)
        _toggleClearText = true;
      else
        _toggleClearText = false;
    });
    widget.onChanged(_searchText.text);
  }

  _mToggleSearchBar() {
    _toggleSearchBar = !_toggleSearchBar;
  }

  _clearSearchField() {
    _searchText.clear();
    widget.onChanged('');
  }

  @override
  void initState() {
    _searchText.addListener(_searchTextChangeListener);
    super.initState();
  }

  @override
  void dispose() {
    _searchText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (!_toggleSearchBar)
          ? Text('Pilih Produk')
          : TextField(
              controller: _searchText,
              autofocus: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Ketik nama produk',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
      actions: <Widget>[
        Builder(
          builder: (context) {
            if (_toggleSearchBar && _toggleClearText)
              return IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  //clear search field
                  setState(() {
                    _clearSearchField();
                  });
                },
              );
            else
              return IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  //clear search field
                  setState(() {
                    _mToggleSearchBar();
                  });
                },
              );
          },
        ),
      ],
    );
  }
}
