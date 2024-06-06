import 'package:camera/camera.dart';
import 'package:currency_detector_app/data/online_data_source.dart';
import 'package:currency_detector_app/ui/screen/scan/diplay_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ScanImageViewModel extends ChangeNotifier{
  late CameraController cameraController;
  late Future<void> initializeControllerFuture;
  bool isSentCorrect = false;
  String? errorText;
  final FlutterTts tts = FlutterTts();
    
  // Function to speak the given text using TTS
  Future<void> speak(String text) async{
    await tts.speak(text);
  }

  ScanImageViewModel(List<CameraDescription> camera){
    cameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      camera[0],
      //define resolution to use
      ResolutionPreset.medium,enableAudio: true
    );
    initializeControllerFuture = cameraController.initialize();
  }

  Future<void> captureImage(BuildContext context)async{
    try{
      await initializeControllerFuture;
      //Attempt to take a picture anfirst d get the file `image` where it was saved.
      final image = await cameraController.takePicture();
      ///if (!mounted) return;
      await sendImageToApi(image.path);
      //isSentCorrect = true;
      notifyListeners();
     Navigator.of(context).push(MaterialPageRoute(
        builder:(context) => DisplayResult(imagePath: image.path),));
    }catch(error){
      errorText = error.toString();
      notifyListeners();
      print("something went wrong : $error");
    }
  }
}