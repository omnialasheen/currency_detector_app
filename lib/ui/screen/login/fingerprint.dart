import 'package:currency_detector_app/ui/screen/home/home_screen.dart';
import 'package:currency_detector_app/ui/screen/login/fingerprint_view_model.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:currency_detector_app/ui/utils/app_color.dart';
import 'package:currency_detector_app/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FingerPrint extends StatelessWidget {
  static String routeName = "Fingerprint";
  FingerPrint({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => FingerPrintViewModel(),
      child: Consumer<FingerPrintViewModel>(
        builder: (context, viewModel, child) {
          /* WidgetsBinding.instance.addPostFrameCallback((_) {
            viewModel.speak('''Welcome to the app 
              Please tap the fingerprint icon in middle bottom to login.''');
           }); */
           return GestureDetector(
           onTap:(){
            viewModel.speak('''finger icon is in middel bottom''');
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
                        //viewModel.speak('''you are right.Tap the fingerprint in you phone .''');
                        await viewModel.authenticateUser();
                        bool isAuthenticated = viewModel.isAuthenticat;
                        if (isAuthenticated == true) {
                          //await Future.delayed(const Duration(seconds: 1)); // Add a delay
                          SharedPreferences loginSharedPreferences = await SharedPreferences.getInstance();
                          await loginSharedPreferences.setBool("isLogin", true);
                          viewModel.speak('''Login success''');
                          Navigator.pushReplacementNamed(context,HomeScreen.routeName);
                        } else {
                          //viewModel.speak('''Login Failed''');
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
                  ],
                ),
              ),
            ),
          ),
        );
      },),
    );
  }
} 