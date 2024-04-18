import 'package:dartz/dartz.dart';

import '../error/failure.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    throw UnimplementedError();
  }
}

class InvalidInputFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}
