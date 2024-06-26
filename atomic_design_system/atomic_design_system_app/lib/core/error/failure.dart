import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({List<dynamic> properties = const <dynamic>[]}) : super();
}

// General Failures
class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ChacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
