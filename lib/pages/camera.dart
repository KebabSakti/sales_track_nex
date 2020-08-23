import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sales_track_nex/utils/helper.dart';
import 'package:sales_track_nex/widget/loading_overlay.dart';

class Camera extends StatefulWidget {
  final List<String> foto;

  Camera({Key key, @required this.foto}) : super(key: key);

  @override
  _CameraState createState() => _CameraState(foto);
}

class _CameraState extends State<Camera> {
  _CameraState(this.foto);

  List<String> foto;

  List<CameraDescription> _cameras;
  CameraController _cameraController;
  bool _isLoading = false;

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (_cameraController != null) {
      await _cameraController.dispose();
    }

    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.medium);

    _cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (_cameraController.value.hasError) {
        print('Camera error ${_cameraController.value.errorDescription}');
      }
    });

    try {
      await _cameraController.initialize();
    } on CameraException catch (e) {
      print(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

  initCamera() {
    availableCameras().then((availableCameras) {
      _cameras = availableCameras;

      if (_cameras.length > 0) {
        _initCameraController(_cameras[0]);
      } else {
        print('No camera available');
      }
    }).catchError((err) {
      print('Error :${err.code}Error message : ${err.message}');
    });
  }

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(foto);

        return null;
      },
      child: Scaffold(
        body: LoadingOverlay(
          isLoading: _isLoading,
          child: Column(
            children: <Widget>[
              Builder(
                builder: (context) {
                  if (_cameraController == null ||
                      !_cameraController.value.isInitialized) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return AspectRatio(
                    aspectRatio: _cameraController.value.aspectRatio,
                    child: Stack(
                      children: <Widget>[
                        CameraPreview(_cameraController),
                        SafeArea(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10, right: 10),
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Builder(
                                    builder: (context) {
                                      return Text(
                                        '${foto.length}',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 24,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[800],
                  child: Center(
                    child: GestureDetector(
                      child: Icon(
                        Icons.camera,
                        size: 50,
                        color: Colors.white,
                      ),
                      onTap: () {
                        _ambilFoto(context, _cameraController);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _ambilFoto(BuildContext context, CameraController cameraController) async {
    try {
      setState(() {
        _isLoading = true;
      });

      final path = join(
        (await getTemporaryDirectory()).path,
        '${Helper().generateRandomId()}.jpg',
      );

      //simpan foto pada path yang sudah di tentukan
      await cameraController.takePicture(path);

      final result = await Navigator.of(context)
          .pushNamed('/preview_foto', arguments: path);

      if (result != null) {
        setState(() {
          foto.add(result);
        });

        if (foto.length >= 3) Navigator.of(context).pop(foto);
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }
}
