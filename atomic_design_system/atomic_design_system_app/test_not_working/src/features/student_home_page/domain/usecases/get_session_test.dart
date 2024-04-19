import 'package:atomic_design_system_app/src/features/session_page/domain/entities/data.dart';
import 'package:atomic_design_system_app/src/features/session_page/domain/entities/session.dart';
import 'package:atomic_design_system_app/src/features/session_page/domain/repositories/session_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:atomic_design_system_app/core/usecases/usecase.dart';
import 'package:atomic_design_system_app/src/features/session_page/domain/usecases/get_session.dart';

class MockSessionRepository extends Mock implements SessionRepository {}

void main() {
  late final GetSession usecase;
  late final MockSessionRepository mockSessionRepository;

  setUp(() {
    mockSessionRepository = MockSessionRepository();
    usecase = GetSession(mockSessionRepository);
  });

  test('should get session token from the repository', () async {
    // arrange
    // email para probar el inicio de sesión
    const String tEmail = 'pro@mironline.io';
    // password para probar el inicio de sesión
    const String tPassword = 'pro456';

    // respuesta de mock Session token esperada
    const tSession = Session(
        success: true,
        message: 'Operación exitosa',
        data: Data(data: {
          'token': 'token session'
        }));

    when(mockSessionRepository.getSession(tEmail, tPassword)).thenAnswer((_) async => const Right(tSession));

    // act
    final result = await usecase(const Params(params: [
      tEmail,
      tPassword
    ]));

    // assert
    expect(result, const Right(tSession));
    verify(mockSessionRepository.getSession(tEmail, tPassword));
    verifyNoMoreInteractions(mockSessionRepository);
  });
}
