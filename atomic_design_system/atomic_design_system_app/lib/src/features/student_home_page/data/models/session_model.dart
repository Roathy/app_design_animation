// ignore_for_file: use_super_parameters

import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/data.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/session.dart';

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
      data: Data(data: {}),
    );

    // late String tokenValue;

    // if (json.containsKey('data')) {
    //   Map<String, dynamic> dataMap = json['data'];
    //   if (dataMap.containsKey('token')) {
    //     tokenValue = dataMap['token'];
    //   }
    // }
    // print(tokenValue);

    // return SessionModel(
    //   success: json['success'],
    //   message: json['message'],
    //   data: Data(data: {
    //     'token': tokenValue,
    //   }),
    // );
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
