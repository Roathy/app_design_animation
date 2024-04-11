import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:atomic_design_system_app/src/features/student_home_page/data/models/session_model.dart';
import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/data.dart';
import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/session.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tSessionModel = SessionModel(
    success: true,
    message: 'test message',
    data: Data(data: {}),
  );

  //   success: true,
  //   message: 'test message',
  //   data: Data(data: {
  //     'token': 'test token'
  //   }),
  // );

  test('should be a subclass of Session entity', () async {
    // assert
    expect(tSessionModel is Session, true);
  });

  group('fromJSON', () {
    test('should return a valid model when the JSON is valid', () {
      // arrange
      // en este línea estamos simulando la obtención de raw data desde alguna fuente de datos (remota/local). La raw data viene en formato JSON que es una cadena de caracteres (String) por lo que utilizamos el método decode para tener una dupla que podamos almacenar en un mapa <String, dynamic>.
      // En esta prueba en particular leemos el archivo fixture session que simula la estructura más no tiene datos reales
      final Map<String, dynamic> jsonMap = json.decode(fixture('session.json'));
      // act
      // La variable result deberá ser un objeto de tipo Session
      final result = SessionModel.fromJSON(jsonMap);
      // assert
      // expect(result is Session, true);
      // expect(result, tSessionModel);
      expect(result, equals(tSessionModel));
    });
  });
}
