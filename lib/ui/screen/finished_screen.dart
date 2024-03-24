import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:currency_detector_app/ui/utils/app_color.dart';
import 'package:currency_detector_app/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  static String routeName = "finished screen";
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
                  Image.asset(AppAssets.done),
                  const Center(child: Text("Total 220 EG",style: AppTheme.loginTitleText,))
            ]),
          ),
        ),
    );
  }
}