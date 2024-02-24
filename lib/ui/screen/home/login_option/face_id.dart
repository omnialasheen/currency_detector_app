import 'package:currency_detector_app/ui/screen/home/login_option/fingerprint.dart';
import 'package:currency_detector_app/ui/screen/home/login_option/local_auth_serives.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:currency_detector_app/ui/utils/app_color.dart';
import 'package:currency_detector_app/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


class FaceID extends StatelessWidget {
  FaceID({super.key});
  static String routeName = "Face ID";
  final FlutterTts tts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    Future<void> speak (String text)async{
      await tts.speak(text);
    }
    
    // Speak initial instructions when the screen is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      speak('''Welcome to the face id login screen. 
         Please tap the face icon int the middel of screen to login.''');
    });

    // GestureDetector : tap detection
    return GestureDetector(
      onTap:(){
        speak("Tap to the middel of screen");
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.primary,AppColor.accet,AppColor.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)),
        child: Scaffold(
          backgroundColor: AppColor.transparent,
          body: SafeArea(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30,),
                const Row(
                  children: [
                    Spacer(),
                    ImageIcon(AssetImage(AppAssets.vector)),
                  ]),
                Container(
                  //constraints: BoxConstraints.tightFor(width: double.infinity),
                  decoration: BoxDecoration(
                    color: AppColor.accet,
                    borderRadius: BorderRadius.circular(100)),
                    padding: const EdgeInsets.all(20),
                  child: const Text("login with Face ID",style: AppTheme.loginTitleText,)),
                const SizedBox(height: 150,), 
                ElevatedButton(
                  onPressed: () async{ 
                        speak("Tap the face id icon to authenticate");
                        bool isAuthenticated = await AuthService.authenticateUser();
                        if(isAuthenticated){
                          Navigator.pushNamed(context, FingerPrint.routeName);
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Authentication failed.")));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.transparent,
                        elevation: 0,
                        //alignment: Alignment.center
                        ),
                  child: Image.asset(AppAssets.logoFaceId)),   
              ]),
          ),
        ),
      ),
    );
  }
}