import 'dart:io';

import 'package:recipes/core/error/app_exception.dart';
import 'package:dio/dio.dart';

AppException throwAppException(exception) {
  if (exception is DioError) {
    return _mapDioErrorToAppException(exception);
  } else {
    return const AppException.unknown();
  }
}

AppException _mapDioErrorToAppException(DioError dioError) {
  if (dioError.type == DioErrorType.connectionError) {
    return AppException.network(errorMessage: dioError.message);
  } else {
    switch (dioError.response?.statusCode) {
      case HttpStatus.unauthorized:
        return AppException.unAuth(errorMessage: dioError.message);
      case HttpStatus.notFound:
        return AppException.notFound(errorMessage: dioError.message);
      default:
        return const AppException.unknown();
    }
  }
}
