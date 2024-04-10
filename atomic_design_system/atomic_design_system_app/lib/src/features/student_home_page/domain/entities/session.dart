import 'package:equatable/equatable.dart';

import 'data.dart';
import 'api_response.dart';

class Session extends Equatable implements APIResponse {
  @override
  final bool success;
  @override
  final String message;
  @override
  final Data data;
  // final Map<String, String> data;

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
