import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/student_today.dart';
import '../repositories/student_today_repository.dart';

class GetStudentToday implements UseCase<StudentToday, NoParams> {
  late final StudentTodayRepository repository;

  GetStudentToday(this.repository);

  @override
  Future<Either<Failure, StudentToday>?> call(NoParams params) async {
    return await repository.getStudentToday();
  }
}
