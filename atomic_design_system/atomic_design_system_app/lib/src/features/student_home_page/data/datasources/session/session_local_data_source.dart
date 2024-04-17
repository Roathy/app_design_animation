import 'package:shared_preferences/shared_preferences.dart';

import '../../models/session_model.dart';
import '../../models/student_today_model.dart';

abstract class SessionLocalDataSource {
  final SharedPreferences sharedPreferences;

  SessionLocalDataSource({required this.sharedPreferences});

  Future<SessionModel> getLastSession();
  Future<void> cacheSession(SessionModel sessionToCache);

  Future<StudentTodayModel> getLastStudentToday();
  Future<void> cacheStudentToday(StudentTodayModel studentTodayToCache);
}
