import 'package:student_app/data/api/custom_exception.dart';
import 'api_consumer.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'package:student_app/data/api/http_response.dart';

class HttpConsumer extends ApiConsumer {
  @override
  Future get(String url, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      var responseJson = handleHttpResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  @override
  Future<dynamic> post(String url, {body, Map<String, String>? headers}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      var responseJson = handleHttpResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}
