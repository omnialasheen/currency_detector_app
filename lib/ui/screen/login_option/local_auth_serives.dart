import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthService{
  static Future<bool> authenticateUser() async{
  final LocalAuthentication localAuthentication = LocalAuthentication();
  bool isAuthenticated = false;
  bool isBiometricSupported = await localAuthentication.isDeviceSupported();
  bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

  if(isBiometricSupported && canCheckBiometrics){
    try{
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'face id for auth');
    }on PlatformException catch(e){
      print(e);
    }
  }
  return isAuthenticated;
  }
}