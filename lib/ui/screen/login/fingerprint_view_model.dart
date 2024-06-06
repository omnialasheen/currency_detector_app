import 'package:currency_detector_app/ui/screen/login/local_auth_serives.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FingerPrintViewModel extends ChangeNotifier{
  bool isAuthenticat = false;
  
  final FlutterTts tts = FlutterTts();
  // Function to speak the given text using TTS
  Future<void> speak(String text) async{
    await tts.speak(text);
  }
  
  Future<void> authenticateUser() async {
    try{
      isAuthenticat = await AuthService.authenticateUser();
    }catch(e){
      print('Error during biometric authentication: $e');
      throw e;
    }
    notifyListeners();
  }
}