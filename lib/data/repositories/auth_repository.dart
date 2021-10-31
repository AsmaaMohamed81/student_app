import 'package:student_app/data/api/api_consumer.dart';
import 'package:student_app/utils/urls.dart';

class AuthRepository {
  final ApiConsumer apiConsumer;
  AuthRepository({required this.apiConsumer});

  Future<dynamic> login(
      {required String email, required String password}) async {
    final response = await apiConsumer
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
    final response = await apiConsumer.post(signupUrl, body: {
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
