// ignore_for_file: use_super_parameters

import 'package:atomic_design_system_app/src/features/session_page/domain/entities/data.dart';
import 'package:atomic_design_system_app/src/features/session_page/domain/entities/session.dart';
import 'package:equatable/equatable.dart';

class SessionModel extends Session implements Equatable {
  const SessionModel({
    required bool success,
    required String message,
    required Data data,
  }) : super(success: success, message: message, data: data);

  factory SessionModel.fromJSON(Map<String, dynamic> json) {
    return SessionModel(
      success: json['success'],
      message: json['message'],
      data: Data(data: json['data']),
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
