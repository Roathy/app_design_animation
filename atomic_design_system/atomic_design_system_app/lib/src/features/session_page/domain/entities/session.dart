import 'package:equatable/equatable.dart';

import 'api_response.dart';
import 'data.dart';

class Session implements APIResponse, Equatable {
  @override
  final bool success;
  @override
  final String message;
  @override
  final Data data;

  const Session({required this.success, required this.message, required this.data});

  @override
  List<Object> get props => [
        success,
        message,
        data
      ];

  @override
  get stringify => false;
}
