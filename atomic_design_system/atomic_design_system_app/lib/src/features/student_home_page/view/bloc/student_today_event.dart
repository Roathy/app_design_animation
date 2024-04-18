part of 'student_today_bloc.dart';

sealed class StudentTodayEvent extends Equatable {
  const StudentTodayEvent();

  @override
  List<Object> get props => [];
}

class GetStudentToday extends StudentTodayEvent {}
