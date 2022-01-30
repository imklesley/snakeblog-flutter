import 'dart:convert';
import 'package:blog_snake/controllers/stores/app_store.dart';
import 'package:blog_snake/models/post_model.dart';
import "package:dio/dio.dart";
import 'package:dio/native_imp.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIClient {

  // Singleton Pattern
  static final APIClient _instance = APIClient._internal();

  APIClient._internal();

  factory APIClient() => _instance;

  final Dio _dio = CustomDio();

  Future get(String url) async {
    final response = await _dio.get(url);

    return response.data;
  }

  Future post(String url,
      {Map<String, dynamic>? headers,
      body,
      encoding,
      List<MapEntry<String, MultipartFile>>? files}) async {
    FormData data = FormData.fromMap(body);

    if (files != null) {
      data.files.addAll(files);
    }

    final response = await _dio.post(url,
        data: data, options: Options(headers: headers, contentType: encoding));

    return response.data;
  }



  Future patch(String url,
      {Map<String, dynamic>? headers,
        body,
        encoding,
        List<MapEntry<String, MultipartFile>>? files}) async {
    FormData data = FormData.fromMap(body);

    if (files != null) {
      data.files.addAll(files);
    }

    final response = await _dio.patch(url,
        data: data, options: Options(headers: headers, contentType: encoding));

    return response.data;
  }

  Future<String> delete(PostModel post) async {
    String url = '/blog/${post.slug}/delete';

    Response response = await _dio.delete(url);

    return response.data['detail'];
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {


    // Logica que pega o token do usuário salvo e adiciona aos headers em cada operação que ele faz
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.containsKey(userKey)) {
      dynamic data = _prefs.getString(userKey);

      if (data != null) {
        data = jsonDecode(data);
        options.headers.addAll({
          "Authorization": "Token ${data['token']}",
        });
      }
    }

    return super.onRequest(options, handler);
  }

  @override
  dynamic onError(DioError err, ErrorInterceptorHandler handler) {
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

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
    print(response.statusCode);
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
      case 429:
        throw Exception('Too Many Requests');
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
