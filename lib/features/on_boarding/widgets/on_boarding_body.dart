import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes/config/routes/app_routes.dart';
import 'package:recipes/core/utils/app_colors.dart';
import 'package:recipes/core/utils/app_strings.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        40.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: AppColors.white,
              size: 16.w,
            ),
            4.horizontalSpace,
            Text(
              AppStrings.premiumRecipes,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ],
        ),
        const Spacer(flex: 6),
        Text(
          AppStrings.letsCooking,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.white,
                fontSize: 56.sp,
              ),
        ),
        8.verticalSpace,
        Text(
          AppStrings.findBestRecipes,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.white,
              ),
        ),
        24.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.homePageRout),
              label: const Text(AppStrings.startCooking),
              icon: const Icon(Icons.arrow_right_alt_rounded),
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
