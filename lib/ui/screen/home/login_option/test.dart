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