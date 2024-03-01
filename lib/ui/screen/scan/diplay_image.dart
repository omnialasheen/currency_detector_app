import 'dart:io';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  static String routeName = "Display Image";
  final String imagePath;
  const DisplayImage({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  backgroundColor: Color(0xff000235),
                  backgroundImage: AssetImage(AppAssets.camera),))
              ),
            ),  
          ],
        )),
    );
  }
}