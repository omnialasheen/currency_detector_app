import 'package:camera/camera.dart';
import 'package:currency_detector_app/data/repo/scan_repo/data_source/online_data_source.dart';
import 'package:currency_detector_app/ui/screen/scan/diplay_image.dart';
import 'package:flutter/material.dart';

class ScanImageViewMode extends ChangeNotifier{
  late CameraController cameraController;
  late Future<void> initializeControllerFuture;

  ScanImageViewMode(List<CameraDescription> camera){
    cameraController =CameraController(
      //// Get a specific camera from the list of available cameras.
      camera[0],
      //define resolution to use
      ResolutionPreset.medium,
    );
    initializeControllerFuture = cameraController.initialize();
  }

  Future<void> captureImage(BuildContext context)async{
    try{
      await initializeControllerFuture;
      //Attempt to take a picture and get the file `image` where it was saved.
      final image = await cameraController.takePicture();
      ///if (!mounted) return;
      await sendImageToApi(image.path);
      Navigator.of(context).push(MaterialPageRoute(
        builder:(context) => DisplayImage(imagePath: image.path),));

    }catch(e){
      print("something went wrong : $e");
    }
  }

}