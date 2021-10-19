import 'dart:convert';
import 'package:http/http.dart' as http;
import 'custom_exception.dart';

dynamic handleHttpResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body);
      return {'status': 200, 'response': responseJson};

    case 201:
      var responseJson = jsonDecode(response.body.toString());
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
