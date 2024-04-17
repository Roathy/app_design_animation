import 'api_response.dart';
import 'data.dart';

class StudentToday implements APIResponse {
  @override
  final bool success;
  @override
  final String message;
  @override
  final Data data;

  StudentToday({
    required this.success,
    required this.message,
    required this.data,
  });
}
