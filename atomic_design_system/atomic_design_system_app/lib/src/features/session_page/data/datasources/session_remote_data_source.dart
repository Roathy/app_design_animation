import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/error/exception.dart';
import '../models/session_model.dart';

abstract class SessionRemoteDataSource {
  Future<SessionModel> getSession(String email, String password);
}

class SessionRemoteDataSourceImpl implements SessionRemoteDataSource {
  final http.Client client;

  SessionRemoteDataSourceImpl({required this.client});

  @override
  Future<SessionModel> getSession(String email, String password) => _getFromUrl(
        'https://api.mironline.io/api/v1/alumno/login',
        email,
        password,
      );

  Future<SessionModel> _getFromUrl(String url, String email, String password) async {
    final response = await client.post(url as Uri, body: {
      'email': email,
      'password': password
    }, headers: {
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'X-App-MirHorizon': 'b150bbb74ca1c0b6d604117fc5250531'
    });
    if (response.statusCode == 200) {
      return SessionModel.fromJSON(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
