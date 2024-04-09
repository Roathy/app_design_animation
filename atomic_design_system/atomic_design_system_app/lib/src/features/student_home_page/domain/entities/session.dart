import 'package:equatable/equatable.dart';

class Session extends Equatable {
  final bool success;
  final String message;
  final Map<String, String> data;

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
