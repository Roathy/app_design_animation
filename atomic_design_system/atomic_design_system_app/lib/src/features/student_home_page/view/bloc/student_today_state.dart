part of 'student_today_bloc.dart';

sealed class StudentTodayState extends Equatable {
  const StudentTodayState();
  
  @override
  List<Object> get props => [];
}

final class StudentTodayInitial extends StudentTodayState {}
