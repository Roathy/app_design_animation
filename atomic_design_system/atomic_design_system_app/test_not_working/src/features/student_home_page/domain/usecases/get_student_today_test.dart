import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:atomic_design_system_app/core/usecases/usecase.dart';
import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/data.dart';
import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/egp.dart';
import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/student_today.dart';
import 'package:atomic_design_system_app/src/features/student_home_page/domain/usecases/get_student_today.dart';
import 'package:atomic_design_system_app/src/features/student_home_page/domain/repositories/session_repository.dart';

class MockSessionRepository extends Mock implements SessionRepository {}

void main() {
  late final GetStudentToday usecase;
  late final MockSessionRepository mockSessionRepository;

  setUp(() {
    mockSessionRepository = MockSessionRepository();
    usecase = GetStudentToday(mockSessionRepository);
  });

  test('should get student today from the repository', () async {
    // respuesta de mock StudentToday esperada
    final tStudentToday = StudentToday(
        success: true,
        message: 'test text',
        data: Data(data: {
          'egp': EGP(
            seriesId: 1,
            seriesTitle: 'test text',
            levelId: 1,
            levelName: 'test text',
            levelTag: 'test text',
            unitId: 1,
            internalUnitId: 1,
            unitTitle: 'test text',
            activityId: 1,
            internalActivityId: 1,
            activityTitle: 'test text',
            instructions: 'test text',
            status: 1,
            coverImageUrl: 'test text',
          ),
          'isa': false,
          'esp': false
        }));

    // arrange
    when(mockSessionRepository.getStudentToday()).thenAnswer((_) async => Right(tStudentToday));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result, Right(tStudentToday));
    verify(mockSessionRepository.getStudentToday());
    verifyNoMoreInteractions(mockSessionRepository);
  });
}
