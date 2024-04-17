import '../../models/student_today_model.dart';

abstract class StudentTodayRemoteDataSource {
  Future<StudentTodayModel> getStudentToday();
}
