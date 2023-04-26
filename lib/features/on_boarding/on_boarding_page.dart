import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipes/core/utils/app_assets.dart';
import 'package:recipes/core/utils/app_colors.dart';
import 'package:recipes/features/on_boarding/widgets/on_boarding_body.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppAssets.onBoardingBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.black.withOpacity(0),
                      AppColors.black,
                    ],
                  ),
                ),
              ),
            ),
          ),
          const OnBoardingBody(),
        ],
      ),
    );
  }
}
