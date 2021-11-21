import 'package:student_app/data/api/dio_consumer.dart';
import 'package:student_app/utils/urls.dart';

class AuthRepository {
  final DioConsumer dioConsumer;
  AuthRepository({required this.dioConsumer});

  Future<dynamic> login(
      {required String email, required String password}) async {
    final response = await dioConsumer
        .post(loginUrl, body: {"email": email, "password": password});
    return response;
  }

  Future<dynamic> signUp(
      {required String userName,
      required String email,
      required String password,
      required String confirmPassword,
      required String firstName,
      required String lastName}) async {
    final response = await dioConsumer.post(signupUrl, body: {
      "userName": userName,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "phone": "",
      "firstName": firstName,
      "lastName": lastName,
      "zoomUserId": " "
    });
    return response;
  }
}
