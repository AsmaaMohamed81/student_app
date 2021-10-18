import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'custom_exception.dart';

class ApiProvider {
// next three lines makes this class a Singleton
  static final ApiProvider _instance = ApiProvider.internal();
  ApiProvider.internal();
  factory ApiProvider() => _instance;

  Future<dynamic> getWithHttp(String url,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> postWithHttp(String url,
      {body, required Map<String, String> headers}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> getWithDio(String url, {Map<String, String>? headers}) async {
    try {
      final response = await Dio().get(url,
          options: 
          Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: headers,
          ));
      var responseJson = _dioResponse(response);

      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> postWithDio(String url,
      {body, Map<String, String>? headers}) async {
    try {
      final response = await Dio().post(url,
          data: body,
          options: Options(
            contentType: 'application/json',
            responseType: ResponseType.plain,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: headers,
          ));
      var responseJson = _dioResponse(response);

      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        // print(responseJson);
        return {'status': 200, 'response': responseJson};

      case 201:
        var responseJson = jsonDecode(response.body.toString());
        // print(responseJson);
        return {'status': 201, 'response': responseJson};

      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  dynamic _dioResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        var responseJson =  json.decode(json.encode(response.data));
        //jsonDecode(response.data.toString());
        // print(responseJson);
        return {'status': 200, 'response': responseJson};
      case 201:
        var responseJson = jsonDecode(response.data.toString());
        //print(responseJson);
        return {'status': 201, 'response': responseJson};

      case 400:
        throw BadRequestException(response.data.toString());

      case 401:

      case 403:
        throw UnauthorisedException(response.data);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
