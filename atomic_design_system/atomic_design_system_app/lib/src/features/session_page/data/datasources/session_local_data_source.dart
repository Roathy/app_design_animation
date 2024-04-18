import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/exception.dart';
import '../models/session_model.dart';

abstract class SessionLocalDataSource {
  Future<SessionModel> getLastSession();
  Future<void> cacheSession(SessionModel sessionToCache);
}

const CACHED_SESSION = 'CACHED_SESSION';

class SessionLocalDataSourceImpl implements SessionLocalDataSource {
  final SharedPreferences sharedPreferences;

  SessionLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<SessionModel> getLastSession() {
    final jsonString = sharedPreferences.getString(CACHED_SESSION);
// este método declara que retorna un futuro, sin embargo getString nos arroja
// un valor de tipo String, por lo que no es necesario usar un wrap de Future.value()
// para retornar el tipo que necesitamos.
    if (jsonString != null) {
      return Future.value(SessionModel.fromJSON(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheSession(SessionModel sessionToCache) {
    return sharedPreferences.setString(
      CACHED_SESSION,
      json.encode(sessionToCache.toJSON()),
    );
  }
}
