import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/student_today.dart';

import '../../../../../core/error/failure.dart';
import '../entities/session.dart';
import 'package:dartz/dartz.dart';

abstract class SessionRepository {
  Future<Either<Failure, Session>>? getSession(String? email, String? password);
  Future<Either<Failure, StudentToday>>? getStudentToday();
}
