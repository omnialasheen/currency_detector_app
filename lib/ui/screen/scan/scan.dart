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


import 'package:currency_detector_app/data/api/api_manager.dart';
import 'package:currency_detector_app/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
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
              };  
      },
      child: Scaffold(
        
        // You must wait until the controller is initialized before displaying the
        // camera preview. Use a FutureBuilder to display a loading spinner until the
        // controller has finished initializing.
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children :[ 
              FutureBuilder<void>(
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
            /* FloatingActionButton(
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
          ), */
          ]),
        ),
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
      appBar: AppBar(title: const Text('Display the Picture'),backgroundColor: AppColor.accet,),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}

 