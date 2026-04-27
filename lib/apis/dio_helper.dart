import 'package:dio/dio.dart';
import 'package:flutter_starter_kit/router/app_router.dart';
import 'package:flutter_starter_kit/utils/local_storage/storage_utility.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class TDioHelper {
  static const String _baseUrl = 'https://qmsapi.studybrainiacs.com/api/';
  static Dio? _dio;

  static Dio get dio {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      //--Pretty Logger 
      _dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ));

      //--Token management ke liye purana interceptor
      _dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // Local storage se token uthayein
            final token = TLocalStorage().readData<String>('access_token');
            if (token != null) {
              // Har request mein header khud add ho jayega
              options.headers['Authorization'] = 'Bearer $token';
            }
            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            if (e.response?.statusCode == 401) {
              // Token expired ya invalid — clear tokens aur login par bhejo
              final localStorage = TLocalStorage();
              await localStorage.removeData('access_token');
              await localStorage.removeData('refresh_token');
              await localStorage.removeData('student_id');
              
              // Navigate to login screen
              TAppRouter.router.go(TAppRouter.login);
            }
            return handler.next(e);
          },
        ),
      );
    }
    return _dio!;
  }

  // --- CRUD METHODS (GET, POST, PUT, DELETE) Same rahenge ---
  static Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try { return await dio.get(endpoint, queryParameters: queryParameters, options: Options(headers: headers)); } catch (e) { rethrow; }
  }

  static Future<Response> post(String endpoint, dynamic data) async {
    try { return await dio.post(endpoint, data: data); } catch (e) { rethrow; }
  }

  static Future<Response> put(String endpoint, dynamic data) async {
    try { return await dio.put(endpoint, data: data); } catch (e) { rethrow; }
  }

  static Future<Response> delete(String endpoint) async {
    try { return await dio.delete(endpoint); } catch (e) { rethrow; }
  }
}