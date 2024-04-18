import 'package:currency_detector_app/ui/screen/finished_screen.dart';
import 'package:currency_detector_app/ui/screen/home/double_scan.dart';
import 'package:currency_detector_app/ui/screen/home/home_screen.dart';
import 'package:currency_detector_app/ui/screen/login/auth_view.dart';
import 'package:currency_detector_app/ui/screen/login/fingerprint.dart';
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
        AuthLogin.routeName:(context) => AuthLogin(),
        HomeScreen.routeName:(context) => HomeScreen(),
        FingerPrint.routeName:(context) => FingerPrint(),
        ScanPictureScreen.routeName:(context) => ScanPictureScreen(myCamera: cameras),
        DoubleScanScreen.routeName:(context) => DoubleScanScreen(),
        FinishScreen.routeName:(context) => FinishScreen(),
      },
      initialRoute: AuthLogin.routeName,
      
    );
  }
}

