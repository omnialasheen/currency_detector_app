import 'package:currency_detector_app/ui/screen/scan/scan.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:currency_detector_app/ui/utils/app_color.dart';
import 'package:currency_detector_app/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static String routeName = "Home Screen"; 
  final FlutterTts tts = FlutterTts();
  @override
  Widget build(BuildContext context) {
   /*  Future<void> speak (String text)async{
      await tts.speak(text);
    } */
    // Speak initial instructions when the screen is loaded
    /* WidgetsBinding.instance.addPostFrameCallback((_) {
      speak('''tap to scan''');
    }); */
    return GestureDetector(
      onTap:() {
        Navigator.pushNamed(context, ScanPictureScreen.routeName);
      },
      child: Container(decoration: const BoxDecoration(
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
                  child: Container(
                    margin: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: const Color(0xff2B3253),
                      border: Border.all(color: AppColor.white),
                      borderRadius: BorderRadius.circular(15)),
                    child: Center(child: Text("Tap to Scan",
                      style: AppTheme.loginTitleText.copyWith(fontWeight: FontWeight.w600),)),),
                ),
              ],
            ),
          ),
        )),
    );
  }
}