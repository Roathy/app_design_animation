import 'package:atomic_design_system_app/src/features/student_home_page/domain/entities/data.dart';

import 'api_response.dart';

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
