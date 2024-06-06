import 'dart:io';
import 'package:currency_detector_app/ui/screen/home/double_scan.dart';
import 'package:currency_detector_app/ui/screen/scan/display_result_view_mdel.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

class DisplayResult extends StatelessWidget {
  DisplayResultViewModel viewModel = DisplayResultViewModel();
  static String routeName = "Display Result";
  final String imagePath;
  DisplayResult({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) { 
    // Speak initial instructions when the screen is loaded
    /* WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.speak('''${viewModel.getValueFromApi()} Egyption pound.''');
    });  */
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
                  child: Center(child: Text("${viewModel.getValueFromApi()}"))),
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