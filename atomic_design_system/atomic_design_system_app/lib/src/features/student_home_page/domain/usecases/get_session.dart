import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/session.dart';
import '../repositories/session_repository.dart';

class GetSession implements UseCase<Session, Params> {
  final SessionRepository repository;

  GetSession(this.repository);

  @override
  Future<Either<Failure, Session>?> call(Params params) async {
    return await repository.getSession(
      params.params[0] as String,
      params.params[1] as String,
    );
  }
}
