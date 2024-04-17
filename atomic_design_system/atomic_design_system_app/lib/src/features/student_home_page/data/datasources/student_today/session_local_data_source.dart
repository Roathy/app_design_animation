import 'package:shared_preferences/shared_preferences.dart';

import '../../models/student_today_model.dart';

abstract class StudentTodayLocalDataSource {
  final SharedPreferences sharedPreferences;

  StudentTodayLocalDataSource({required this.sharedPreferences});

  Future<StudentTodayModel> getLastStudentToday();
  Future<void> cacheStudentToday(StudentTodayModel sessionToCache);
}
