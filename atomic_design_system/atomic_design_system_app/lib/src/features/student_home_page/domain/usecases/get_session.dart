import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/session.dart';
import '../../../../../core/error/failure.dart';
import '../repositories/session_repository.dart';
import '../../../../../core/usecases/usecase.dart';

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

class Params extends Equatable {
  final List<dynamic> params;

  const Params({required this.params});

  @override
  List<Object?> get props => [
        params
      ];
}
