import 'package:currency_detector_app/ui/screen/scan/display_result_view_mdel.dart';
import 'package:currency_detector_app/ui/utils/app_assets.dart';
import 'package:currency_detector_app/ui/utils/app_color.dart';
import 'package:currency_detector_app/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  DisplayResultViewModel viewModel = DisplayResultViewModel();
  static String routeName = "finished screen";
  FinishScreen({super.key});

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
                  Center(child: Text("Total ${viewModel.getTotalAmountLastMinute()} EG",style: AppTheme.loginTitleText,))
            ]),
          ),
        ),
    );
  }
}