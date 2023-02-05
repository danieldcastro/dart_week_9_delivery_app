import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('accessToken');

    options.headers['Authorization'] = 'Bearer $accessToken';

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);

    if (err.response?.statusCode == 401) {
      final sp = await SharedPreferences.getInstance();
      sp.clear();
      //Redirecionar o usuário para a home
      return handler.next(err);
    } else {
      return handler.next(err);
    }
  }
}
