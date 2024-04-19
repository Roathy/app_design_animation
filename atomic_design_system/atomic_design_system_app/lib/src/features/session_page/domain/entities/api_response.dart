import 'data.dart';

abstract class APIResponse {
  final bool success;
  final String message;
  final Data data;

  APIResponse({required this.success, required this.message, required this.data});
}
