part of 'session_bloc.dart';

sealed class SessionState extends Equatable {
  // const SessionState(this.session, this.message);

  // final Session? session;
  // final String? message;

  const SessionState();

  @override
  List<Object?> get props => [
        // session,
        // message,
      ];
}

// final class SessionInitial extends SessionState {}
class Empty extends SessionState {}

class Loading extends SessionState {}

class Loaded extends SessionState {
  final Session session;
  const Loaded({required this.session});
}

class Error extends SessionState {
  final String errorMessage;
  const Error({required this.errorMessage});
}
