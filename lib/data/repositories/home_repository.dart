import 'package:student_app/data/api/dio_consumer.dart';
import 'package:student_app/utils/urls.dart';

class HomeRepository {
  final DioConsumer dioConsumer;
  HomeRepository({required this.dioConsumer});
  
  Future<dynamic> getStudentDashboard({required String studentId}) async {
    final response =
        await dioConsumer.get("$studentDashboardUrl?studentId=$studentId");
    return response;
  }
}
