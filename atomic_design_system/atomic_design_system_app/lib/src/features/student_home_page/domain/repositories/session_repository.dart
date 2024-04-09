import '../../../../../core/error/failure.dart';
import '../entities/session.dart';
import 'package:dartz/dartz.dart';

abstract class SessionRepository {
  Future<Either<Failure, Session>>? getSession(String? email, String? password);
}
