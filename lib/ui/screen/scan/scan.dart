import 'package:currency_detector_app/data/api/api_manager.dart';
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
}



 