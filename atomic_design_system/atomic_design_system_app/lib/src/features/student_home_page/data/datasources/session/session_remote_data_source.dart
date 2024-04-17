import '../../models/session_model.dart';
import '../../models/student_today_model.dart';

abstract class SessionRemoteDataSource {
  Future<SessionModel> getSession(String email, String password);
  Future<StudentTodayModel> getStudentToday();
}
