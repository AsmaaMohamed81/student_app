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
}
