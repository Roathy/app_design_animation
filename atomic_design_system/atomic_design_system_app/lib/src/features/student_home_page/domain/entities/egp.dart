import 'package:equatable/equatable.dart';

class EGP extends Equatable {
  final int _seriesId;
  final String _seriesTitle;
  final int _levelId;
  final String _levelName;
  final String _levelTag;
  final int _unitId;
  final int _internalUnitId;
  final String _unitTitle;
  final int _activityId;
  final int _internalActivityId;
  final String _activityTitle;
  final String _instructions;
  final int _status;
  final String _coverImageUrl;

  const EGP({
    required int seriesId,
    required String seriesTitle,
    required int levelId,
    required String levelName,
    required String levelTag,
    required int unitId,
    required int internalUnitId,
    required String unitTitle,
    required int activityId,
    required int internalActivityId,
    required String activityTitle,
    required String instructions,
    required int status,
    required String coverImageUrl,
  })  : _seriesId = seriesId,
        _seriesTitle = seriesTitle,
        _levelId = levelId,
        _levelName = levelName,
        _levelTag = levelTag,
        _unitId = unitId,
        _internalUnitId = internalUnitId,
        _unitTitle = unitTitle,
        _activityId = activityId,
        _internalActivityId = internalActivityId,
        _activityTitle = activityTitle,
        _instructions = instructions,
        _status = status,
        _coverImageUrl = coverImageUrl;

  @override
  List<Object?> get props => [
        _seriesId,
        _seriesTitle,
        _levelId,
        _levelName,
        _levelTag,
        _unitId,
        _internalUnitId,
        _unitTitle,
        _activityId,
        _internalActivityId,
        _activityTitle,
        _instructions,
        _status,
        _coverImageUrl,
      ];
}
