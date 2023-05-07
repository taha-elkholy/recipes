import 'package:flutter/material.dart' show immutable;

@immutable
class AppStrings {
  static const String appName = 'Recipes';
  static const String noRouteFound = 'No Route Found';

  /// OnBoarding Page
  static const String premiumRecipes = '60k+ Premium recipes';
  static const String letsCooking = 'Let’s\nCooking';
  static const String findBestRecipes = 'Find best recipes for cooking';
  static const String startCooking = 'Start cooking';

  /// Home Page
  static const String findBestRecipesTitle = 'Find best recipes\nfor cooking';
  static const String searchHint = 'Search recipes';

  /// shared preferences
  static const String tokenKey = 'TOKEN_KEY';

  /// headers
  static const String accept = 'Accept';
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';

  /// error messages
  static const String networkErrorMessage = 'No Internet Connection';
  static const String unAuthErrorMessage = 'Your Session End, Login Again';
  static const String unknownErrorMessage =
      'Something went wrong\nplease try again later';
  static const String inCorrectInputsErrorMessage =
      'Email or Password not correct';
  static const String notFoundErrorMessage = 'The Required Data Not Found';
}
