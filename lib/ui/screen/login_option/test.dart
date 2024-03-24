/* import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class ScanPictureScreen extends StatefulWidget {
  static String routeName = "Scan Screen";
  final List<CameraDescription> myCamera;
  const ScanPictureScreen({super.key,required this.myCamera});
  //final CameraDescription camera;
  @override
  State<ScanPictureScreen> createState() => _ScanPictureScreenState();
}

class _ScanPictureScreenState extends State<ScanPictureScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _cameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.myCamera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _cameraController.initialize();
  }
  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_cameraController);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _cameraController.takePicture();

            if (!mounted) return;

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}

 */


//fingerprint screen
  /* import 'package:currency_detector_app/ui/screen/home/home_screen.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:currency_detector_app/ui/utils/app_color.dart';
import 'package:currency_detector_app/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'local_auth_serives.dart';

class FingerPrint extends StatelessWidget {
  static String routeName = "Fingerprint";
  const FingerPrint({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.primary,AppColor.accet,AppColor.primary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        body: SafeArea(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30,),
              const Row(
                children: [
                  Spacer(),
                  ImageIcon(AssetImage(AppAssets.vector)),
                ]),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.accet,
                  borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.all(20),
                child: const Text("login with FingerPrint",style: AppTheme.loginTitleText,)),
              const Spacer(),
              ElevatedButton(
                onPressed:() async{
                      bool isAuthenticated = await AuthService.authenticateUser();
                      if(isAuthenticated){
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Authentication failed.")));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.transparent,
                      elevation: 0),
                child: Image.asset(AppAssets.logoFingerprint,)),   
            ]),
        ),
      ),
    );
  }
} 
 */


//scan Screen
/* import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class ScanPictureScreen extends StatefulWidget {
  static String routeName = "Scan Screen";
  final List<CameraDescription> myCamera;
  const ScanPictureScreen({super.key,required this.myCamera});
  //final CameraDescription camera;
  @override
  State<ScanPictureScreen> createState() => _ScanPictureScreenState();
}

class _ScanPictureScreenState extends State<ScanPictureScreen> {
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _cameraController = CameraController(widget.myCamera[0],ResolutionPreset.medium,);
    _cameraController.initialize().then((value) {
      if(!mounted){ return;}
      setState(() {
        
      });
    });
  }
  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if(!_cameraController.value.isInitialized){
      return CircularProgressIndicator();
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: AspectRatio(
        aspectRatio: _cameraController.value.aspectRatio,
        child: CameraPreview(_cameraController),
      )
    );
  }
}


 */


//face id screen
/* 
import 'package:currency_detector_app/ui/screen/home/login_option/fingerprint.dart';
import 'package:currency_detector_app/ui/screen/home/login_option/local_auth_serives.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:currency_detector_app/ui/utils/app_color.dart';
import 'package:currency_detector_app/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


class FaceID extends StatelessWidget {
  FaceID({super.key});
  static String routeName = "Face ID";
  final FlutterTts tts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    Future<void> speak (String text)async{
      await tts.speak(text);
    }
    
    // Speak initial instructions when the screen is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      speak('''Welcome to the face id login screen. 
         Please tap the face icon int the middel of screen to login.''');
    });

    // GestureDetector : tap detection
    return GestureDetector(
      onTap:(){
        speak("Tap to the middel of screen");
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.primary,AppColor.accet,AppColor.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)),
        child: Scaffold(
          backgroundColor: AppColor.transparent,
          body: SafeArea(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30,),
                const Row(
                  children: [
                    Spacer(),
                    ImageIcon(AssetImage(AppAssets.vector)),
                  ]),
                Container(
                  //constraints: BoxConstraints.tightFor(width: double.infinity),
                  decoration: BoxDecoration(
                    color: AppColor.accet,
                    borderRadius: BorderRadius.circular(100)),
                    padding: const EdgeInsets.all(20),
                  child: const Text("login with Face ID",style: AppTheme.loginTitleText,)),
                const SizedBox(height: 150,), 
                ElevatedButton(
                  onPressed: () async{ 
                        speak("Tap the face id icon to authenticate");
                        bool isAuthenticated = await AuthService.authenticateUser();
                        if(isAuthenticated){
                          Navigator.pushNamed(context, FingerPrint.routeName);
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Authentication failed.")));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.transparent,
                        elevation: 0,
                        //alignment: Alignment.center
                        ),
                  child: Image.asset(AppAssets.logoFaceId)),   
              ]),
          ),
        ),
      ),
    );
  }
} */



//scan sceen before mvvm :
/* import 'package:currency_detector_app/data/api/api_manager.dart';
import 'package:currency_detector_app/ui/screen/scan/diplay_image.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ScanPictureScreen extends StatefulWidget {
  static String routeName = "Scan Screen";
  final List<CameraDescription> myCamera;
  const ScanPictureScreen({super.key,required this.myCamera});
  //final CameraDescription camera;
  @override
  State<ScanPictureScreen> createState() => _ScanPictureScreenState();
}

class _ScanPictureScreenState extends State<ScanPictureScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    //It initializes _cameraController with the first camera from the list and 
    //sets the resolution preset to medium.
    _cameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.myCamera[0],
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _cameraController.initialize();
  }
  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        // Provide an onPressed callback.
              // Take the Picture in a try / catch. If anything goes wrong,
              // catch the error.
              try {
                // Ensure that the camera is initialized.
                await _initializeControllerFuture;
        
                // Attempt to take a picture and get the file `image`
                // where it was saved.
                final image = await _cameraController.takePicture();
        
                if (!mounted) return;
                await sendImageToApi(image.path);
                
                // If the picture was taken, display it on a new screen.
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DisplayImage(imagePath: image.path)
                  ),
                );
              } catch (e) {
                // If an error occurs, log the error to the console.
                print(e);
              };  
      },
      child: Scaffold(
        // You must wait until the controller is initialized before displaying the
        // camera preview. Use a FutureBuilder to display a loading spinner until the
        // controller has finished initializing.
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: FutureBuilder<void>(
                future: _initializeControllerFuture, 
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the camera.
                    return CameraPreview(_cameraController);
                  } else {
                    // Otherwise, display a loading indicator.
                    return const Center(child: CircularProgressIndicator());
                  }
                },
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                      color: const Color(0xff3E4258),
                      child: const Center(child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xff000235),
                        backgroundImage: AssetImage(AppAssets.camera),))),
              ), 
            ],
          ),
        ),
      ),
    );
  }
} */
