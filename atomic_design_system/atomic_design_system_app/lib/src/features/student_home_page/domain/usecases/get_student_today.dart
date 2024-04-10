import 'package:dartz/dartz.dart';

import '../entities/student_today.dart';
import '../../../../../core/error/failure.dart';
import '../repositories/session_repository.dart';
import '../../../../../core/usecases/usecase.dart';

class GetStudentToday implements UseCase<StudentToday, NoParams> {
  late final SessionRepository repository;

  GetStudentToday(this.repository);

  @override
  Future<Either<Failure, StudentToday>?> call(NoParams params) async {
    return await repository.getStudentToday();
  }
}
