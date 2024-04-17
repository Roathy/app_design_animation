import 'package:dartz/dartz.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/session.dart';
import '../../domain/repositories/session_repository.dart';
import '../datasources/session/session_local_data_source.dart';
import '../datasources/session/session_remote_data_source.dart';

class SessionRespositoryImpl implements SessionRepository {
  final SessionRemoteDataSource remoteDataSource;
  final SessionLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  SessionRespositoryImpl({required this.remoteDataSource, required this.localDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Session>> getSession(String email, String password) async {
    if (await networkInfo.isConnected) {
      // Call remoteDataSource to get session data
      // Return result wrapped in Right or Left
      try {
        final remoteSession = await remoteDataSource.getSession(email, password);
        localDataSource.cacheSession(remoteSession);
        return Right(remoteSession);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // Call localDataSource to get cached session data
        // Return result wrapped in Right or Left
        final localSession = await localDataSource.getLastSession();
        return Right(localSession);
      } on CacheException {
        return Left(ChacheFailure());
      }
    }
  }
}

// future refactor from: https://www.youtube.com/watch?v=bfEKPKKy9dA&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech&index=7
// 37:14