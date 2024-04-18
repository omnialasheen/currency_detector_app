import 'dart:io';
import 'package:currency_detector_app/ui/screen/home/double_scan.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DisplayImage extends StatelessWidget {
  static String routeName = "Display Image";
  final String imagePath;
  final FlutterTts tts = FlutterTts();
  late int scanResult;
  DisplayImage({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    Future<void> speak(String text) async {
      await tts.speak(text);
    }

    // Speak initial instructions when the screen is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      speak('''20 Egyption pound.''');
    });
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DoubleScanScreen.routeName);
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 7,
                child: Image.file(File(imagePath))),
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromARGB(255, 95, 98, 108),
                  child: const Center(child: Text("20"))),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: const Color(0xff3E4258),
                  child: const Center(child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff000235),
                    backgroundImage: AssetImage(AppAssets.microphoneIcon),))
                ),
              ),  
            ],
          )),
      ),
    );
  }
}