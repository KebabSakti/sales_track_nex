import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sales_track_nex/utils/helper.dart';
import 'package:sales_track_nex/widget/loading_overlay.dart';

//class PreviewFoto extends StatelessWidget {
//  final String path;
//  const PreviewFoto({Key key, @required this.path}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    FotoBloc fotoBloc = BlocProvider.of<FotoBloc>(context);
//
//    Future<String> _compressFoto(String foto) async {
//      final targetPath = join((await getTemporaryDirectory()).path,
//          'small_${Helper().generateRandomId()}.jpg');
//
//      var compressedImage = await FlutterImageCompress.compressAndGetFile(
//          foto, targetPath,
//          quality: 60);
//
//      return compressedImage.path;
//    }
//
//    _keepFoto() async {
//      fotoBloc.add(SaveFoto(await _compressFoto((path))));
//    }
//
//    return BlocListener<FotoBloc, FotoState>(
//      listener: (context, state) {
//        if (state is SaveFotoComplete) Navigator.of(context).pop();
//      },
//      child: WillPopScope(
//        onWillPop: () {
//          _keepFoto();
//          return null;
//        },
//        child: Scaffold(
//          appBar: AppBar(
//            backgroundColor: Colors.transparent,
//            elevation: 0,
//          ),
//          extendBodyBehindAppBar: true,
//          extendBody: true,
//          body: Stack(
//            children: <Widget>[
//              Column(
//                children: <Widget>[
//                  Container(
//                    child: Image.file(
//                      File(path),
//                      fit: BoxFit.cover,
//                    ),
//                  ),
//                  Expanded(
//                    child: Container(
//                      color: Colors.grey[800],
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          IconButton(
//                            icon: Icon(
//                              Icons.check,
//                              color: Colors.green,
//                              size: 40,
//                            ),
//                            onPressed: () {
//                              _keepFoto();
//                            },
//                          ),
//                          SizedBox(width: 15),
//                          IconButton(
//                            icon: Icon(
//                              Icons.clear,
//                              color: Colors.red,
//                              size: 40,
//                            ),
//                            onPressed: () {
//                              Navigator.of(context).pop();
//                            },
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              BlocBuilder<FotoBloc, FotoState>(
//                builder: (context, state) {
//                  print(state);
//                  if (state is SaveFotoLoading)
//                    return Container(
//                      color: Colors.black.withOpacity(0.8),
//                      child: Center(
//                        child: CircularProgressIndicator(),
//                      ),
//                    );
//
//                  return SizedBox.shrink();
//                },
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

class PreviewFoto extends StatefulWidget {
  PreviewFoto({Key key, @required this.foto}) : super(key: key);

  final String foto;

  @override
  _PreviewFotoState createState() => _PreviewFotoState();
}

class _PreviewFotoState extends State<PreviewFoto> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future<String> _compressFoto(String foto) async {
      final targetPath = join((await getTemporaryDirectory()).path,
          'small_${Helper().generateRandomId()}.jpg');

      var compressedImage = await FlutterImageCompress.compressAndGetFile(
          foto, targetPath,
          quality: 60);

      return compressedImage.path;
    }

    _keepFoto() async {
      setState(() {
        _isLoading = true;
      });

      Navigator.of(context).pop(await _compressFoto(widget.foto));
    }

    _deleteFoto() {
      Navigator.of(context).pop();
    }

    return WillPopScope(
      onWillPop: () {
        _keepFoto();
        return null;
      },
      child: LoadingOverlay(
        isLoading: _isLoading,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: Column(
            children: <Widget>[
              Container(
                child: Image.file(
                  File(widget.foto),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[800],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 40,
                        ),
                        onPressed: () {
                          _keepFoto();
                        },
                      ),
                      SizedBox(width: 15),
                      IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.red,
                          size: 40,
                        ),
                        onPressed: () {
                          _deleteFoto();
                        },
                      ),
                    ],
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
