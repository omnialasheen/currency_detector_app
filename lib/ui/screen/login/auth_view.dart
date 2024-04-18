import 'package:currency_detector_app/ui/screen/home/home_screen.dart';
import 'package:currency_detector_app/ui/screen/login/fingerprint.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLogin extends StatefulWidget {
  AuthLogin({super.key});
  static String routeName = "Auth Login";

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }
  Future<void> check()async{
    SharedPreferences loginSharedPreferences = await SharedPreferences.getInstance();
    bool isLogin = loginSharedPreferences.getBool("isLogin")?? false;
    if(isLogin){
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {
    return FingerPrint();
  }
}