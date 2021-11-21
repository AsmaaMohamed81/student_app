import 'package:student_app/data/api/dio_consumer.dart';
import 'package:student_app/utils/urls.dart';

class HomeRepository {
  final DioConsumer dioConsumer;

  HomeRepository({required this.dioConsumer});

  Future<dynamic> getStudentInfo({required String studentId}) async {
    final response =
        await dioConsumer.get("$studentInfoUrl?studentId=$studentId");
    print("$response");

    return response;
  }

  Future<dynamic> getStudentMatrial({required String classId}) async {
    final response =
        await dioConsumer.get("$studentMaterialUrl??ClassId=$classId");
    print("$response");

    return response;
  }
}
