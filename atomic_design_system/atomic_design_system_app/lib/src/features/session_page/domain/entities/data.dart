import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final dynamic data;

  const Data({required this.data});

  @override
  List<Object> get props => [
        data
      ];
}
