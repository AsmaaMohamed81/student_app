import 'package:flutter/cupertino.dart';
import 'package:student_app/data/api/api_consumer.dart';
import 'package:student_app/utils/urls.dart';

class HomeRepository {
  final ApiConsumer apiConsumer;

  HomeRepository({required this.apiConsumer});

  Future<dynamic> getStudentInfo({required String studentId}) async {
    final response =
        await apiConsumer.get("$studentInfoUrl?studentId=$studentId");
    print("$response");

    return response;
  }

  Future<dynamic> getStudentMatrial({required String classId}) async {
    final response =
        await apiConsumer.get("$studentMaterialUrl??ClassId=$classId");
    print("$response");

    return response;
  }
}
