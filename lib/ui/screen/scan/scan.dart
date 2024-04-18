import 'package:camera/camera.dart';
import 'package:currency_detector_app/ui/screen/scan/scan_view_model.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

class ScanPictureScreen extends StatelessWidget {
  static String routeName = "Scan Screen";
  final List<CameraDescription> myCamera;
  const ScanPictureScreen({super.key,required this.myCamera});

  @override
  Widget build(BuildContext context) {
    final viewModel = ScanImageViewMode(myCamera);
    return GestureDetector(
      onTap: () => viewModel.captureImage(context),
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

/* class MoneyRectanglesPainter extends CustomPainter {
  final List<Rect> detectedMoneyRectangles; // List of detected money bounding boxes
  MoneyRectanglesPainter({required this.detectedMoneyRectangles});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Loop through detectedMoneyRectangles and draw a rectangle for each one
    for (final rect in detectedMoneyRectangles) {
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint unless something changes
  }
} */
