import 'package:camera/camera.dart';
import 'package:currency_detector_app/ui/screen/scan/scan_view_model.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanPictureScreen extends StatefulWidget {
  static String routeName = "Scan Screen";
  final List<CameraDescription> myCamera;
  ScanPictureScreen({super.key,required this.myCamera});

  @override
  State<ScanPictureScreen> createState() => _ScanPictureScreenState();
}

class _ScanPictureScreenState extends State<ScanPictureScreen> {
  late ScanImageViewModel viewModel;

  @override
  void initState(){

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.speak('''camera opened''');
      
    });
  }
  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<ScanImageViewModel>(context); 
    return GestureDetector(
      onTap: () async{
        await viewModel.captureImage(context);
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: FutureBuilder<void>(
                  future: viewModel.initializeControllerFuture, 
                  builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the camera.
                  return CameraPreview(viewModel.cameraController);
                } else if(snapshot.hasError){
                  return Center(child: Text(viewModel.errorText??""));
                }else{
                  // Otherwise, display a loading indicator.
                  return const Center(child: CircularProgressIndicator());
                }
                },),
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