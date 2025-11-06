import 'package:dio/dio.dart';

class HttpClient {
  static late Dio dio;

  void init() {
    dio =
        Dio(
            BaseOptions(
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              headers: {
                'Accept': 'application/json',
                'User-Agent': 'your-parking-space/1.0 (Flutter)',
              },
            ),
          )
          ..interceptors.add(
            InterceptorsWrapper(
              onResponse: (res, handler) {
                final data = res.data;
                if (res.statusCode == 200 &&
                    data is Map<String, dynamic> &&
                    data['error'] == true) {
                  return handler.reject(
                    DioException(
                      requestOptions: res.requestOptions,
                      response: res,
                      type: DioExceptionType.badResponse,
                      message: '${data['reason'] ?? 'Unknown'}',
                    ),
                  );
                }
                handler.next(res);
              },
            ),
          );
  }
}
