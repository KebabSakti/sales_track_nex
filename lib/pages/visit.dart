import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/foto_bloc.dart';
import 'package:sales_track_nex/bloc/keranjang_bloc.dart';
import 'package:sales_track_nex/bloc/scanner_bloc.dart';
import 'package:sales_track_nex/bloc/visit_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/utils/helper.dart';
import 'package:toast/toast.dart';

class Visit extends StatefulWidget {
  @override
  _VisitState createState() => _VisitState();
}

class _VisitState extends State<Visit> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _barcode = TextEditingController();
  final TextEditingController _latitude = TextEditingController();
  final TextEditingController _longitude = TextEditingController();
  final TextEditingController _namaOutlet = TextEditingController();
  final TextEditingController _pemilik = TextEditingController();
  final TextEditingController _telp = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final FocusNode _nodeOutlet = FocusNode();
  final FocusNode _nodePemilik = FocusNode();
  final FocusNode _nodeTelp = FocusNode();
  final FocusNode _nodeAlamat = FocusNode();
  LocationData mLocationData;
  List<dynamic> outletTutupData;
  int tutup = 0;

  VisitBloc visitBloc;

  List<String> _foto = [];
  bool _tokoTutup = false;
  bool _showFotoError = false;

  @override
  void initState() {
    visitBloc = BlocProvider.of<VisitBloc>(context);

    _barcode.text = visitBloc.state.outletData?.barcode;
    _latitude.text = visitBloc.state.outletData?.lat;
    _longitude.text = visitBloc.state.outletData?.lng;
    _namaOutlet.text = visitBloc.state.outletData?.outletName;

    super.initState();
  }

  @override
  void dispose() {
    _barcode.dispose();
    _latitude.dispose();
    _longitude.dispose();
    _namaOutlet.dispose();
    _pemilik.dispose();
    _telp.dispose();
    _alamat.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final KeranjangBloc keranjangBloc = BlocProvider.of<KeranjangBloc>(context);
    // ignore: close_sinks
    final FotoBloc fotoBloc = BlocProvider.of<FotoBloc>(context);
    // ignore: close_sinks
    final VisitBloc visitBloc = BlocProvider.of<VisitBloc>(context);
    // ignore: close_sinks
    final AuthenticateBloc authenticateBloc =
        BlocProvider.of<AuthenticateBloc>(context);

    return WillPopScope(
      onWillPop: () async {
        if (visitBloc.state.outletData != null ||
            fotoBloc.state.foto.length > 0 ||
            keranjangBloc.state.keranjangDetail.sum > 0) {
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

                    visitBloc.add(ResetVisitData());
                    fotoBloc.add(SaveListFoto([]));
                    keranjangBloc.add(Resetkeranjang());
                  },
                ),
              ],
            ),
          );

          return false;
        } else {
          return true;
        }
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<ScannerBloc, ScannerState>(
            listener: (context, state) {
              print(state);
              _scannerBlocListener(context, state);
            },
          ),
          BlocListener<VisitBloc, VisitState>(
            listener: (context, state) {
              print(state);
              _visitBlocListener(context, state);
            },
          ),
          BlocListener<FotoBloc, FotoState>(
            listener: (context, state) {
              _fotoBlocListener(context, state);
            },
          ),
        ],
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text('Visit Outlet'),
                floating: false,
                pinned: true,
                actions: <Widget>[
                  PopupMenuButton(
                    onSelected: (value) async {
                      //toko tutup
                      final result = await Navigator.of(context)
                          .pushNamed('/pilih_outlet');

                      if (result != null) {
                        outletTutupData = result;
                        tutup = 1;
                        User user = BlocProvider.of<AuthenticateBloc>(context)
                            .state
                            .user;
                        //validate outlet
                        BlocProvider.of<VisitBloc>(context).add(ValidateOutlet(
                          scanResult: outletTutupData[0].barcode,
                          locationData: outletTutupData[1],
                          user: user,
                        ));
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 1,
                        height: 10,
                        child: Text('Outlet Tutup'),
                      ),
                    ],
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Data Outlet',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  controller: _barcode,
                                  readOnly: true,
                                  textInputAction: TextInputAction.next,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    labelText: 'Barcode',
                                    hintText: 'AICE IDNXXXXXX',
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    isDense: true,
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.camera,
                                        color: Colors.grey[400],
                                      ),
                                      onPressed: () {
                                        _barcodeScanner();
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'scan qr untuk mengisi';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: TextFormField(
                                        controller: _latitude,
                                        readOnly: true,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          labelText: 'Latitude',
                                          hintText: '0.0',
                                          filled: true,
                                          fillColor: Colors.grey[100],
                                          isDense: true,
                                          hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'scan qr untuk mengisi';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Container(
                                      child: TextFormField(
                                        controller: _longitude,
                                        readOnly: true,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          labelText: 'Longitude',
                                          hintText: '0.0',
                                          filled: true,
                                          fillColor: Colors.grey[100],
                                          isDense: true,
                                          hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'scan qr untuk mengisi';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Container(
                                child: TextFormField(
                                  controller: _namaOutlet,
                                  focusNode: _nodeOutlet,
                                  autofocus: false,
                                  readOnly: true,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: 'Nama Outlet',
                                    hintText: 'Toko Mister X',
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    isDense: true,
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Nama outlet tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          child: Row(
                            children: <Widget>[
                              Material(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.grey[100],
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: InkWell(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.camera_alt,
                                          color: (_showFotoError)
                                              ? Colors.red
                                              : Colors.grey[400],
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Sentuh untuk mengambil foto',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: (_showFotoError)
                                                ? Colors.red
                                                : Colors.grey[400],
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () async {
                                      if (fotoBloc.state.foto.length >= 3) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            content: Text(
                                                'Ambil ulang foto outlet ?'),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text('Tidak'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              FlatButton(
                                                child: Text('Ya'),
                                                onPressed: () async {
                                                  _resetFoto();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        _getFotoResult();
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          mainAxisSpacing: 15),
                                  itemBuilder: (context, index) {
                                    return BlocBuilder<FotoBloc, FotoState>(
                                      builder: (context, state) {
                                        var _foto = fotoBloc.state.foto;
                                        if (_foto.length > 0) {
                                          if (_foto
                                              .asMap()
                                              .containsKey(index)) {
                                            return Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                image: DecorationImage(
                                                  image: FileImage(
                                                    File(_foto[index]),
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          }
                                        }

                                        return Material(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.grey[100],
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: (_showFotoError)
                                                    ? Colors.red
                                                    : Colors.blue,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: InkWell(
                                              child: Center(
                                                child: Icon(
                                                  Icons.image,
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<FotoBloc, FotoState>(
                          builder: (context, state) {
                            if (state.foto.length < 3) {
                              return Container(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Foto tidak boleh kurang dari 3',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.red),
                                ),
                              );
                            }

                            return SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<KeranjangBloc, KeranjangState>(
                    builder: (context, state) {
                      if (state.keranjangDetail !=
                          null) if (state.keranjangDetail.sum > 0) {
                        return Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Orderan',
                                    style: TextStyle(
                                        color: Colors.grey[800], fontSize: 16),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 16),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          '/order_product',
                                          arguments: false);
                                    },
                                  ),
                                ],
                              ),
                              Divider(),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Metode Pembayaran',
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      '${state.keranjangDetail.pembayaran}',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Jumlah',
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      '${state.keranjangDetail.keranjangData.length} Produk',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Total Bayar',
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      '${Helper().getFormattedNumber(state.keranjangDetail.sum)}',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }

                      return SizedBox.shrink();
                    },
                  ),
                ]),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                ),
              )
            ],
          ),
          bottomSheet: Row(
            children: <Widget>[
              BlocBuilder<KeranjangBloc, KeranjangState>(
                builder: (context, state) {
                  if (state.keranjangDetail?.sum == 0) {
                    return Expanded(
                      child: Container(
                        height: 45,
                        child: FlatButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          child: Text(
                            'Buat PO',
                            style: TextStyle(color: Colors.grey[100]),
                          ),
                          onPressed: () {
                            if (tutup == 0) {
                              if (_formKey.currentState.validate() &&
                                  fotoBloc.state.foto.length >= 3) {
                                Navigator.of(context)
                                    .pushNamed('/order_product');
                              }
                            } else {
                              Toast.show(
                                  'Toko tutup tidak bisa buat PO', context,
                                  gravity: Toast.CENTER);
                            }
                          },
                        ),
                      ),
                    );
                  }

                  return SizedBox.shrink();
                },
              ),
              Expanded(
                child: Container(
                  height: 45,
                  child: FlatButton(
                    color: Colors.deepPurple[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.grey[100]),
                    ),
                    onPressed: () {
                      //validate all form
                      if (_formKey.currentState.validate() &&
                          _foto.length == 3) {
                        visitBloc.add(SubmitVisit(
                          outletData: visitBloc.state.outletData,
                          locationData: mLocationData,
                          foto: fotoBloc.state.foto,
                          user: authenticateBloc.state.user,
                          keranjangDetail: keranjangBloc.state.keranjangDetail,
                          tutup: tutup,
                        ));
                      }
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

  _barcodeScanner() {
    BlocProvider.of<ScannerBloc>(context).add(ScanQR());
  }

  _resetFoto() async {
    _foto = [];
    BlocProvider.of<FotoBloc>(context).add(ResetFoto());
  }

  _getFotoResult() async {
    var result =
        await Navigator.of(context).pushNamed('/camera', arguments: _foto);
    BlocProvider.of<FotoBloc>(context).add(SaveListFoto(result));
  }

  _scannerBlocListener(BuildContext context, ScannerState state) {
    if (state is ScanQRCompleted) {
      mLocationData = state.locationData;
      tutup = 0;
      //get logged in user
      User user = BlocProvider.of<AuthenticateBloc>(context).state.user;
      //validate outlet
      BlocProvider.of<VisitBloc>(context).add(ValidateOutlet(
        scanResult: state.scanResult.rawContent,
        locationData: state.locationData,
        user: user,
      ));
    }
  }

  _visitBlocListener(BuildContext context, VisitState state) {
    if (state is ValidateOutletComplete) {
      print('validate oke');
      _setDataOutletField(state.outletData, state.locationData);
    } else if (state is ValidateOutletError) {
      Toast.show(state.message, context, gravity: Toast.CENTER);
    } else if (state is SubmitVisitComplete) {
      _resetState();
      Toast.show('Data berhasil di simpan', context, gravity: Toast.CENTER);

      Navigator.of(context).pop();
    }
  }

  _fotoBlocListener(BuildContext context, FotoState state) {
    if (state is ResetFotoComplete) {
      Navigator.of(context).pop();
      _getFotoResult();
    }
  }

  void _resetState() {
    BlocProvider.of<VisitBloc>(context).add(ResetVisitData());
    BlocProvider.of<FotoBloc>(context).add(SaveListFoto([]));
    BlocProvider.of<KeranjangBloc>(context).add(Resetkeranjang());
  }

  void _setDataOutletField(OutletData outletData, LocationData locationData) {
    mLocationData = locationData;

    //set field
    _barcode.text = outletData.barcode;
    _latitude.text = locationData.latitude.toString();
    _longitude.text = locationData.longitude.toString();
    _namaOutlet.text = outletData.outletName;
  }
}

class OrderEmptyState extends StatelessWidget {
  const OrderEmptyState({
    Key key,
    @required TextEditingController barcode,
  })  : _barcode = barcode,
        super(key: key);

  final TextEditingController _barcode;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Builder(
          builder: (context) {
            return Center(
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.remove_shopping_cart,
                    color: Colors.grey[200],
                    size: 40,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Belum ada orderan',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    onPressed: () {
//                      if (!_formKey.currentState.validate()) {
                      Navigator.of(context).pushNamed('/order_product',
                          arguments: _barcode.text);
//                      }
                    },
                    child: Text(
                      'Buat PO Outlet',
                      style: TextStyle(color: Colors.blue),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
