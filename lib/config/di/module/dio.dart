import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:recipes/config/di/injectable.dart';
import 'package:recipes/core/api/end_points.dart';
import 'package:recipes/core/network/network_info.dart';
import 'package:recipes/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppDioInject {
  Dio get dio {
    Dio dio = Dio();
    dio.interceptors.add(AppInterceptor());
    return dio;
  }
}

class AppInterceptor extends Interceptor {
  String? get token =>
      getIt<SharedPreferences>().getString(AppStrings.tokenKey);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final connection = await NetworkInfo().isConnected;

    debugPrint('AppInterceptor=> token:$token');
    debugPrint('AppInterceptor=> request path is:${options.path}');

    if (connection) {
      options.baseUrl = EndPoints.baseUrl;
      options.sendTimeout = const Duration(seconds: 10);
      options.connectTimeout = const Duration(seconds: 5);
      options.contentType = AppStrings.applicationJson;
      options.receiveTimeout = const Duration(seconds: 15);
      options.responseType = ResponseType.json;
      options.receiveDataWhenStatusError = true;
      options.followRedirects = false;
      options.validateStatus = (status) {
        return status! < 500;
      };

      options.headers.addAll(
        {
          AppStrings.accept: AppStrings.applicationJson,
          AppStrings.authorization: '${AppStrings.bearer} $token'
        },
      );

      handler.next(options);
    } else {
      handler.reject(
        DioError(
          requestOptions: options,
          type: DioErrorType.connectionError,
          message: AppStrings.networkErrorMessage,
        ),
      );
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('''AppInterceptor=> status code: ${response.statusCode}\n
        data: ${response.data}''');
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      handler.next(response);
    } else {
      String? errorMessage;

      try {
        // todo: get error message from backend
      } catch (_) {}
      handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          response: response,
          message: errorMessage,
        ),
      );
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint('AppInterceptor=> Dio Error is:${err.message}');
    handler.reject(err);
  }
}
