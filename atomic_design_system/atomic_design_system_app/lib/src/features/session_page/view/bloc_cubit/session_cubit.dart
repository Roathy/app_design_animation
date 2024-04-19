// ignore_for_file: constant_identifier_names, type_literal_in_constant_pattern

import 'package:atomic_design_system_app/core/error/failure.dart';
import 'package:atomic_design_system_app/src/features/session_page/data/repositories/session_repository_impl.dart';
import 'package:atomic_design_system_app/src/features/session_page/domain/entities/data.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/session.dart';

part 'session_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'The input is invalid';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit(this._sessionRepository) : super(Initial());
  final SessionRespositoryImpl _sessionRepository;

  Future<void> getSession() async {
    emit(Loading());
    final apiResponse = await _sessionRepository.getSession('pro@mironline.io', 'pro456');
    final sessionResponse = apiResponse.fold((failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return const Session(success: false, message: SERVER_FAILURE_MESSAGE, data: Data(data: null));
        case CacheFailure:
          return const Session(success: false, message: CACHE_FAILURE_MESSAGE, data: Data(data: null));
        default:
          return const Session(success: false, message: INVALID_INPUT_FAILURE_MESSAGE, data: Data(data: null));
      }
    }, (session) => session);
    emit(ResponseSession(session: sessionResponse));
  }

  Future<void> getSessionWithFailure() async {
    emit(Loading());
    try {
      final apiResponse = await _sessionRepository.getSession('pro@mironline.io', 'pro456');
      if (apiResponse.isRight()) {
        final session = apiResponse.getOrElse(() => const Session(success: false, message: INVALID_INPUT_FAILURE_MESSAGE, data: Data(data: null)));
      }
    } catch (e) {
      emit(ErrorSession(message: e.toString()));
    }
  }
}

class CacheFailure {}
