import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'student_today_event.dart';
part 'student_today_state.dart';

class StudentTodayBloc extends Bloc<StudentTodayEvent, StudentTodayState> {
  StudentTodayBloc() : super(StudentTodayInitial()) {
    on<StudentTodayEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
