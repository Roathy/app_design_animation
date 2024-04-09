import 'package:atomic_design_system_app/core/error/failure.dart';
import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/session.dart';
import 'package:dartz/dartz.dart';

import '../repositories/session_repository.dart';

class GetSession {
  final SessionRepository repository;
  GetSession(this.repository);

  Future<Either<Failure, Session>?> execute({
    required String email,
    required String password,
  }) async {
    return await repository.getSession(email, password);
  }
}
