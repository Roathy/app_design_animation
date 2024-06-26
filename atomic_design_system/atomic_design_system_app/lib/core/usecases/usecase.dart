import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>?> call(Params params);
}

class Params extends Equatable {
  final List<dynamic> params;

  const Params({required this.params});

  @override
  List<Object?> get props => [
        params
      ];
}

class NoParams extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool? get stringify => false;
}
