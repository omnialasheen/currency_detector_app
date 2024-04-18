import 'package:currency_detector_app/ui/screen/login/local_auth_serives.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FingerPrintViewModel {
  final FlutterTts tts = FlutterTts();
  // Function to speak the given text using TTS
  Future<void> speak(String text) async{
    await tts.speak(text);
  }
  
  Future<bool> authenticateUser() async {
    bool isAuthenticated = await AuthService.authenticateUser();
    return isAuthenticated;
  }
}