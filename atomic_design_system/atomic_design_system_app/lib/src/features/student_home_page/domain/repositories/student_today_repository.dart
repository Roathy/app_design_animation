import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/student_today.dart';

abstract class StudentTodayRepository {
  Future<Either<Failure, StudentToday>>? getStudentToday();
}
