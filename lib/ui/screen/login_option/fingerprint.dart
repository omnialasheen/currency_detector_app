import 'package:currency_detector_app/ui/screen/home/home_screen.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:currency_detector_app/ui/utils/app_color.dart';
import 'package:currency_detector_app/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'local_auth_serives.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FingerPrint extends StatelessWidget {
  static String routeName = "Fingerprint";
  final FlutterTts tts = FlutterTts();
  FingerPrint({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // Function to speak the given text using TTS
    Future<void> speak(String text) async {
      await tts.speak(text);
    }

    // Speak initial instructions when the screen is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      speak('''Welcome to the fingerprint login screen. 
       Please tap the fingerprint icon to login.''');
    });

    return GestureDetector(
      onTap:(){
        speak('''finger icon is in middel bottom''');
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.primary, AppColor.accet, AppColor.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: AppColor.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.1),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.accet,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      "Login with Fingerprint",
                      style: AppTheme.loginTitleText,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.61,),
                ElevatedButton(
                  onPressed: () async {
                    speak('''you are right.. Tap the fingerprint in you phone .''');
                    bool isAuthenticated = await AuthService.authenticateUser();
                    if (isAuthenticated) {
                      //await Future.delayed(const Duration(seconds: 1)); // Add a delay
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login failed.")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.transparent,
                    elevation: 0,
                  ),
                  child: Image.asset(AppAssets.logoFingerprint),
                ),
                //SizedBox(height: height * 0.9,)
              ],
            ),
          ),
        ),
      ),
    );
  }
} 