import 'dart:convert';
import 'dart:developer' as developer;

import 'package:atomic_design_system_app/src/features/student_home_page/data/models/student_today_model.dart';
import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/egp.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/data.dart';
import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/session.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  const tStudentToday = StudentTodayModel(
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
      // 'egp': true,
      'isa': false,
      'esp': false,
    }),
  );

  developer.log(tStudentToday.toString());

  test('should be a subclass of Session entity', () async {
    // assert
    expect(tStudentToday is Session, true);
  });

  group('fromJSON', () {
    test('should return a valid model when the JSON is valid', () {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('student_today.json'));
      // act
      final result = StudentTodayModel.fromJSON(jsonMap);
      // assert
      // expect(result is Session, true);
      // expect(result, tSessionModel);
      // expect(result, equals(tSessionModel));
      expect(result.success, tStudentToday.success);
      expect(result.message, tStudentToday.message);
      // expect(result.data, tStudentToday.data);
      // expect(result.data.props, tStudentToday.data.props);
      // expect(result.data.props[0].toString(), tStudentToday.data.props[0].toString());
    });
  });

  group('toJSON', () {
    test('should return a JSON map containing the proper data', () async {
      // arrange
      final result = tStudentToday.toJSON();
      final expectedMap = {
        'success': true,
        'message': 'test text',
        'data': const Data(data: {
          'egp': {
            'seriesId': 1,
            'seriesTitle': 'test text',
            'levelId': 1,
            'levelName': 'test text',
            'levelTag': 'test text',
            'unitId': 1,
            'internalUnitId': 1,
            'unitTitle': 'test text',
            'activityId': 1,
            'internalActivityId': 1,
          },
          'isa': false,
          'esp': false,
        }),
      };
      // assert
      expect(result, expectedMap);
    });
  });
}
