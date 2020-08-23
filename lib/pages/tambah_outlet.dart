import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/scanner_bloc.dart';
import 'package:sales_track_nex/bloc/tambah_outlet_bloc.dart';
import 'package:toast/toast.dart';

class TambahOutlet extends StatefulWidget {
  @override
  _TambahOutletState createState() => _TambahOutletState();
}

class _TambahOutletState extends State<TambahOutlet> {
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

  @override
  void initState() {
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
    return MultiBlocListener(
      listeners: [
        BlocListener<TambahOutletBloc, TambahOutletState>(
          listener: (context, state) {
            _tambahOutletBlocListener(context, state);
          },
        ),
        BlocListener<ScannerBloc, ScannerState>(
          listener: (context, state) {
            _scannerBlocListener(context, state);
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tambah Outlet'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 60),
          child: Form(
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
                      fillColor: Colors.white,
                      isDense: true,
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.camera,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          _barcodeScanner();
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'barcode tidak boleh kosong';
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
                            fillColor: Colors.white,
                            isDense: true,
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'latitude tidak boleh kosong';
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
                            fillColor: Colors.white,
                            isDense: true,
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'longitude tidak boleh kosong';
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
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Nama Outlet',
                      hintText: 'Toko Mister X',
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
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
                Container(
                  child: TextFormField(
                    controller: _pemilik,
                    focusNode: _nodePemilik,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Pemilik',
                      hintText: 'Mister X',
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: TextFormField(
                    controller: _telp,
                    focusNode: _nodeTelp,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Telp',
                      hintText: '0812xxxxxxxxxxxx',
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: TextFormField(
                    controller: _alamat,
                    focusNode: _nodeAlamat,
                    textInputAction: TextInputAction.newline,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Alamat',
                      hintText: 'Jl Kedondong No 2',
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          height: 45.0,
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
              if (_formKey.currentState.validate()) {
                _submitNewOutlet();
              }
            },
          ),
        ),
      ),
    );
  }

  _barcodeScanner() {
    BlocProvider.of<ScannerBloc>(context).add(ScanQR());
  }

  _scannerBlocListener(BuildContext context, ScannerState state) {
    if (state is ScanQRCompleted) {
      //validate outlet
      BlocProvider.of<TambahOutletBloc>(context)
          .add(ValidateOutlet(qr: state.scanResult.rawContent));
    }
  }

  _tambahOutletBlocListener(BuildContext context, TambahOutletState state) {
    if (state is ValidateOutletComplete) {
      var scannerBloc = BlocProvider.of<ScannerBloc>(context).state;
      _barcode.text = scannerBloc.scanResult.rawContent;
      _latitude.text = scannerBloc.locationData.latitude.toString();
      _longitude.text = scannerBloc.locationData.longitude.toString();
    } else if (state is ValidateOutletError) {
      Toast.show(state.message, context, gravity: Toast.CENTER);
    } else if (state is InsertNewOutletComplete) {
      Toast.show('Outlet berhasil di tambahkan', context,
          gravity: Toast.CENTER, duration: 4);
      //back
      Navigator.of(context).pop();
    } else if (state is InsertNewOutletError) {
      Toast.show(state.message, context, gravity: Toast.CENTER);
    }
  }

  _submitNewOutlet() {
    BlocProvider.of<TambahOutletBloc>(context).add(InsertNewOutlet(
      barcode: _barcode.text,
      lat: _latitude.text,
      lng: _longitude.text,
      namaOutlet: _namaOutlet.text,
      owner: _pemilik.text,
      telp: _telp.text,
      alamat: _alamat.text,
    ));
  }
}
