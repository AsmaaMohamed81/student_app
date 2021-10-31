import 'package:student_app/data/api/api_consumer.dart';
import 'package:student_app/utils/urls.dart';

class ForgetPasswordRepository {
  final ApiConsumer apiConsumer;
  ForgetPasswordRepository({required this.apiConsumer});

  Future<dynamic> sendEmail({required String email}) async {
    final response = await apiConsumer.get("$forgetPasssword?Email=$email");
    return response;
  }

  Future<dynamic> sendVeifyCode(
      {required String email, required String code}) async {
    final response =
        await apiConsumer.get("$verificationCodeUrL?Email=$email&Code=$code");
    return response;
  }

  Future<dynamic> resetLostPassword(
      {required String email, required String passWord}) async {
    final response = await apiConsumer
        .get("$resetLostPasswordUrl?Email=$email&Password=$passWord");
    return response;
  }
}
