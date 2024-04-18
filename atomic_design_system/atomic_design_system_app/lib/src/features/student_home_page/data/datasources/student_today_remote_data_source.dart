import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/error/exception.dart';
import '../models/student_today_model.dart';

abstract class StudentTodayRemoteDataSource {
  Future<StudentTodayModel> getStudentToday();
}

class StudentTodayRemoteDataSourceImpl implements StudentTodayRemoteDataSource {
  final http.Client client;

  StudentTodayRemoteDataSourceImpl({required this.client});

  @override
  Future<StudentTodayModel> getStudentToday() => _getFromUrl('https://api.mironline.io/api/v1/alumno/today');

  Future<StudentTodayModel> _getFromUrl(String url) async {
    final response = await client.get(url as Uri, headers: {
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'X-App-MirHorizon': 'b150bbb74ca1c0b6d604117fc5250531'
    });
    if (response.statusCode == 200) {
      return StudentTodayModel.fromJSON(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
