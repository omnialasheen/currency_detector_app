import 'package:currency_detector_app/ui/screen/finished_screen.dart';
import 'package:currency_detector_app/ui/screen/scan/scan.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:currency_detector_app/ui/utils/app_color.dart';
import 'package:currency_detector_app/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DoubleScanScreen extends StatelessWidget {
  DoubleScanScreen({super.key});
  static String routeName = "double scan Screen"; 
  final FlutterTts tts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    /* Future<void> speak (String text)async{
      await tts.speak(text);
    } */
    // Speak initial instructions when the screen is loaded
    /* WidgetsBinding.instance.addPostFrameCallback((_) {
      speak('''Tap to finish or double tap to scan again''');
    }); */
    return Container(decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.primary,AppColor.accet,AppColor.primary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 7,
                child: Image.asset(AppAssets.logovoice,)),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                      Navigator.pushReplacementNamed(context, ScanPictureScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.ButtonColor,
                      padding: const EdgeInsets.all(30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: AppColor.white)
                      )
                    ), child: const  Text("Scan Again",style: AppTheme.loginTitleText,)),
                    const SizedBox(width: 18,),
                    ElevatedButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, FinishScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.ButtonColor,
                      padding: const EdgeInsets.all(30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: AppColor.white))
                    ), child: const Text("Finish",style: AppTheme.loginTitleText,))
                  ]),
              ),
            ],
          ),
        ),
      ));
  }
}