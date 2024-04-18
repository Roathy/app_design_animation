import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/session.dart';

abstract class SessionRepository {
  Future<Either<Failure, Session>>? getSession(String email, String password);
}
