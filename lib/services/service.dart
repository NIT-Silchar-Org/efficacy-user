import 'package:dio/dio.dart';

class NetworkEngine {
  late Dio _dio;

  final baseUrl = "https://efficacybackend.onrender.com/api/";

  NetworkEngine() {
    _dio = Dio(
      BaseOptions(
        headers: {"accept": "application/json"},
        baseUrl: baseUrl,
      ),
    );
    initializeInterceptor();
  }

  Future<Response> post(
      {required Map<String, dynamic> data, required String endPoint}) async {
    Response response;
    try {
      response = await _dio.post(endPoint, data: data);
      return response;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  // Future<Response> postWithoutData({required String endPoint}) async {
  //   Response response;
  //   print('trying to post method call');
  //   try {
  //     response = await _dio.post(
  //       endPoint,
  //     );
  //     print(response);

  //     return response;
  //   } on DioError catch (e) {
  //     print(e.message);
  //     throw Exception(e.message);
  //   }
  // }

  Future<Response> get({required String endPoint}) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
      return response;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  initializeInterceptor() {
    _dio.interceptors
        .add(InterceptorsWrapper(onError: (error, errorInterceptorHandler) {
      print(error.message);
      return errorInterceptorHandler.next(error);
    }, onRequest: (request, requestInterceptorHandler) {
      print('''
        ******************************************************************************************************

        ${request.method} || ${request.path} || ${request.data}

        ******************************************************************************************************
        ''');
      return requestInterceptorHandler.next(request);
    }, onResponse: (response, responseInterceptorHandler) {
      print('''
          -******************************************************************************************************
          ${response.statusMessage} || ${response.statusCode} |||| ${response.data}
          --******************************************************************************************************
          ''');

      return responseInterceptorHandler.next(response);
    }));
  }
}
