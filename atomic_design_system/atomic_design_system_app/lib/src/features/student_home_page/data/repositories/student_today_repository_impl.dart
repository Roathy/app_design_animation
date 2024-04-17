import 'package:dartz/dartz.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/student_today.dart';
import '../../domain/repositories/student_today_repository.dart';
import '../datasources/student_today/session_local_data_source.dart';
import '../datasources/student_today/session_remote_data_source.dart';

class StudentTodayRespositoryImpl implements StudentTodayRepository {
  final StudentTodayRemoteDataSource remoteDataSource;
  final StudentTodayLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  StudentTodayRespositoryImpl({required this.remoteDataSource, required this.localDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, StudentToday>> getStudentToday() async {
    if (await networkInfo.isConnected) {
      // Call remoteDataSource to get studentToday data
      // Return result wrapped in Right or Left
      try {
        final remoteStudentToday = await remoteDataSource.getStudentToday();
        localDataSource.cacheStudentToday(remoteStudentToday);
        return Right(remoteStudentToday);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // Call localDataSource to get cached studentToday data
        // Return result wrapped in Right or Left
        final localStudentToday = await localDataSource.getLastStudentToday();
        return Right(localStudentToday);
      } on CacheException {
        return Left(ChacheFailure());
      }
    }
  }
}
