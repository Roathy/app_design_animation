// ignore_for_file: use_super_parameters
import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/data.dart';
import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/egp.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/student_today.dart';

class StudentTodayModel extends StudentToday implements Equatable {
  StudentTodayModel({
    required bool success,
    required String message,
    required Data data,
  }) : super(success: success, message: message, data: data);

  factory StudentTodayModel.fromJSON(Map<String, dynamic> json) {
    final egp = json['data']['egp'];

    return StudentTodayModel(
      success: json['success'],
      message: json['message'],
      data: Data(data: {
        'egp': EGP(
          seriesId: egp['id_serie'],
          seriesTitle: egp['serie'],
          levelId: egp['id_nivel'],
          levelName: egp['nivel'],
          levelTag: egp['nivel_tag'],
          unitId: egp['id_unidad'],
          internalUnitId: egp['int_unidad'],
          unitTitle: egp['unidad'],
          activityId: egp['id_actividad'],
          internalActivityId: egp['int_actividad'],
          activityTitle: egp['titulo'],
          instructions: egp['instrucciones'],
          status: egp['estatus'],
          coverImageUrl: egp['cover_actividad'],
        ),
        // 'egp': true,
        'isa': false,
        'esp': false,
      }),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }

  @override
  List<Object> get props => [
        success,
        message,
        data
      ];

  @override
  get stringify => false;
}
