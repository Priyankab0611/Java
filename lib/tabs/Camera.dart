import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:storage_path/storage_path.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:whatsapp_demo/repo/ImageModel.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<CameraDescription> cameras;
  CameraController _cameraController;
  @override
  void initState() {
    initializeCamera();
    super.initState();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras.first, ResolutionPreset.high);
    _cameraController.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController.value.isInitialized) {
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: CameraPreview(_cameraController),
          ),
          _cameraButtonWidget(),
          // _galleryWidget(),
        ],
      ),
    );
  }

  Widget _cameraButtonWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.flash_on,
              color: Colors.white,
              size: 30,
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  border: Border.all(color: Colors.white, width: 2)),
            ),
            Icon(
              Icons.camera_alt,
              size: 30,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget _galleryWidget() {
    return Positioned(
      bottom: 100,
      right: 0,
      left: 0,
      child: Container(
        height: 55,
        child: FutureBuilder(
            future: StoragePath.imagesPath,
            builder: (context, snapshot) {
              List<dynamic> imageList = json.decode(snapshot.data);
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageList.length,
                itemBuilder: (_, index) {
                  ImageModel imageModel = ImageModel.fromjson(imageList[index]);
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 70,
                    width: 60,
                    decoration:
                        BoxDecoration(color: Colors.red.withOpacity(.2)),
                    child: FadeInImage(
                      image: FileImage(File(imageModel.files[0])),
                      fit: BoxFit.cover,
                      placeholder: MemoryImage(kTransparentImage),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}
