import 'package:camera/camera.dart';
import 'package:currency_detector_app/data/repo/scan_repo/data_source/online_data_source.dart';
import 'package:currency_detector_app/ui/screen/scan/diplay_image.dart';
import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';

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
    // loadModel();
  }

  Future<void> captureImage(BuildContext context)async{
    try{
      await initializeControllerFuture;
      //Attempt to take a picture and get the file `image` where it was saved.
      final image = await cameraController.takePicture();
      //await runModel(image.path);
      ///if (!mounted) return;
      await sendImageToApi(image.path);
      Navigator.of(context).push(MaterialPageRoute(
        builder:(context) => DisplayImage(imagePath: image.path),));

    }catch(e){
      print("something went wrong : $e");
    }
  }
  /* var recognitionsList;
  Future<void> runModel(String imagePath) async{
     try {
      // recognitionsList = await Tflite.detectObjectOnImage(
      //   path: imagePath,
      //   numResultsPerClass: 1,       // Number of results per class to be detected
      //   threshold: 0.4,
      // );

      print("Recognitions: $recognitionsList");

      // Notify listeners if needed
      notifyListeners();
    } catch (e) {
      print("Error running model: $e");
    }
  } */

  // Future<void> loadModel() async{
  //   Tflite.close();
  //   await Tflite.loadModel(
  //     model: "assets/ssd_mobilenet.tflite",
  //     labels: "assets/ssd_mobilenet.txt");
  // }


  /* List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
  List<Widget> boxes = [];

  if (recognitionsList != null) {
    for (var recognition in recognitionsList) {
      double left = recognition["rect"]["x"] * screen.width;
      double top = recognition["rect"]["y"] * screen.height;
      double width = recognition["rect"]["w"] * screen.width;
      double height = recognition["rect"]["h"] * screen.height;

      boxes.add(
        Positioned(
          left: left,
          top: top,
          width: width,
          height: height,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
            child: Text(
              "${recognition['detectedClass']} (${(recognition['confidenceInClass'] * 100).toStringAsFixed(0)}%)",
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
  }

  return boxes;
} */

}