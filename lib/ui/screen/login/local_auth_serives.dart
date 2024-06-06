import 'package:local_auth/local_auth.dart';

class AuthService{
  static Future<bool> authenticateUser() async{
  final LocalAuthentication localAuthentication = LocalAuthentication();
  bool isAuthenticated = false;
  //if the device support biometric authentication or not? 
  bool isBiometricSupported = await localAuthentication.isDeviceSupported();
  
  //if biometric are availble on device(user enroll with them or not) ?
  bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;
  if(isBiometricSupported && canCheckBiometrics){
    try{
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Fingerprint for auth');
    }catch(e){
      print('Unexpected error during biometric authentication: $e');
    }
  }
  return isAuthenticated;
  
 /*  try{
  //if the device support biometric authentication or not? 
  bool isBiometricSupported = await localAuthentication.isDeviceSupported();
  
  //if biometric are availble on device(user enroll with them or not) ?
  bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

  if(isBiometricSupported && canCheckBiometrics){
      return  await localAuthentication.authenticate(
        localizedReason: 'Fingerprint for auth');
  }else{
    throw PlatformException(
      code: 'Biometric_Not_Available',
      message: 'Biometric authentication is not supported or available on this device');
  }
  }on PlatformException catch(e){
    print('Error during biometric authentication: $e');
    throw e;
  }catch(e){
    print('Unexpected error during biometric authentication: $e');
    throw e;
  } */
  }
}