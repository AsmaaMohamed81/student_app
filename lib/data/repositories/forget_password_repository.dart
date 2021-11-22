import 'package:student_app/data/api/dio_consumer.dart';
import 'package:student_app/utils/urls.dart';

class ForgetPasswordRepository {
  final DioConsumer dioConsumer;
  ForgetPasswordRepository({required this.dioConsumer});




  Future<dynamic> resetLostPassword(
      {required String email, required String passWord}) async {
    final response = await dioConsumer
        .get("$resetLostPasswordUrl?Email=$email&Password=$passWord");
    return response;
  }
}
