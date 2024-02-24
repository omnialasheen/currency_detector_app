import 'package:currency_detector_app/ui/screen/home/home_screen.dart';
import 'package:currency_detector_app/ui/screen/home/login_option/face_id.dart';
import 'package:currency_detector_app/ui/screen/home/login_option/fingerprint.dart';
import 'package:currency_detector_app/ui/screen/scan/scan.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


late List<CameraDescription>  cameras;
Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        FaceID.routeName:(context) =>  FaceID(),
        FingerPrint.routeName:(context) => FingerPrint(),
        ScanPictureScreen.routeName:(context) => ScanPictureScreen(myCamera: cameras),
      },
      initialRoute: FingerPrint.routeName,
      
    );
  }
}

