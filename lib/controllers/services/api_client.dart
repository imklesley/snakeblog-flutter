import 'dart:io';
import "package:dio/dio.dart";
import 'package:dio/native_imp.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIClient {
  // Singleton Pattern
  static final APIClient _instance = APIClient._internal();

  APIClient._internal();

  factory APIClient() => _instance;

  final Dio _dio = CustomDio();

  Future get(String url) async {
    Map<String, dynamic>? responseJson;

    try {
      final response = await _dio.get(url);

      responseJson = parseResponse(response);
    } on DioError catch (e) {
      parseResponse(e.response!.data);
    }

    return responseJson;
  }

  Future post(String url,
      {Map<String, dynamic>? headers,
      body,
      encoding,
      List<MapEntry<String, MultipartFile>>? files}) async {
    Map<String, dynamic>? responseJson;

    try {
      FormData data = FormData.fromMap(body);

      if (files != null) {
        data.files.addAll(files);
      }

      final response = await _dio.post(url,
          data: data,
          options: Options(headers: headers, contentType: encoding));

      responseJson = parseResponse(response);
    } on DioError catch (e) {
      // print(e.response?.data);
      parseResponse(e.response!);
    }

    return responseJson;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: Recuperar do device
    options.headers.addAll(
        {"Authorization": "Token 74d18e4f5b018f91d694ca9ce58c32cdbd2cea2e"});
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    if (error.response!.statusCode == HttpStatus.unauthorized) {
      // TODO: Fazer lógica de nova autenticação para usuário com token vencido
    }
    return super.onError(error, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //TODO:
    return super.onResponse(response, handler);
  }
}

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = dotenv.env['BASE_URL']!;
    options.connectTimeout = 5000;
    options.receiveTimeout = 5000;

    interceptors.add(ApiInterceptors());
  }
}

dynamic parseResponse(Response response) {
  if (response.statusCode != null) {
    // TODO: Make the others success code like 201,202 ...
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 400:
        throw Exception("Bad Request. Please try again later.");
      case 401:
        throw Exception("Invalid credentials.");
      case 403:
        throw Exception("You do not have permission to access this.");
      case 404:
        throw Exception('Page not found.');
      case 500:
        throw Exception("Internal Server Error.");
      case 503:
        throw Exception("Unable to reach server.");
      default:
        throw Exception(
            'Error occurred while communicating with server. Status Code: ${response.statusCode}');
    }
  } else {
    throw Exception(
        "The connection to the server timed out. Please try again later.");
  }
}
