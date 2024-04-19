part of 'session_cubit.dart';

@immutable
abstract class SessionState {}

class Initial extends SessionState {
  final bool isSession = false;

  @override
  String toString() {
    return 'Session Inicial: Session: false';
  }
}

class Loaded extends SessionState {
  final bool isSession = true;
  final Session session;

  Loaded({required this.session});
}

class Loading extends SessionState {}

class ResponseSession extends SessionState {
  final Session session;

  ResponseSession({required this.session});
}

class ErrorSession extends SessionState {
  final String message;

  ErrorSession({required this.message});
}
