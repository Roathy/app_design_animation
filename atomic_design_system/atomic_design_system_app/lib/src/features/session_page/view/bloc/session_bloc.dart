import 'package:atomic_design_system_app/src/features/session_page/domain/entities/session.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final GetSession getSession;

  SessionBloc(this.getSession) : super(Empty()) {
    on<SessionEvent>((event, emit) {});
  }
}
