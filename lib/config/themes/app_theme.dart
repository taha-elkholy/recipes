import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes/core/utils/app_colors.dart';

@immutable
class AppTheme {
  static get appThemeLight => ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: 'Inter',
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: AppColors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
          iconTheme: IconThemeData(color: AppColors.black),
        ),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: AppColors.grey,
          hintStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.all(8.w),
          border: _drawBorder(),
          focusedBorder: _drawBorder(),
          enabledBorder: _drawBorder(),
          disabledBorder: _drawBorder(),
          errorBorder: _drawBorder(color: Colors.red),
          focusedErrorBorder: _drawBorder(color: Colors.red),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: AppColors.titleColor,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),titleMedium: TextStyle(
            color: AppColors.titleColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: AppColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: TextStyle(
            color: AppColors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: TextStyle(
            color: AppColors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.r),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 32.w,
              vertical: 16.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            textStyle: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

  static OutlineInputBorder _drawBorder({
    Color? color,
  }) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: color ?? AppColors.lightGrey,
        ),
      );
}
