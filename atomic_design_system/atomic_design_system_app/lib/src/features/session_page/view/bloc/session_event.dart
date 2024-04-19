part of 'session_bloc.dart';

sealed class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class GetSession extends SessionEvent {
  // final String email;
  // final String password;

  // const GetSession({required this.email, required this.password}) : super();
  final Session session;
  const GetSession({required this.session});
}
