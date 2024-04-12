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

  // int get seriesId => _seriesId;
  // set seriesId(int value) => _seriesId = value;

  // String get seriesTitle => _seriesTitle;
  // set seriesTitle(String value) => _seriesTitle = value;

  // int get levelId => _levelId;
  // set levelId(int value) => _levelId = value;

  // String get levelName => _levelName;
  // set levelName(String value) => _levelName = value;

  // String get levelTag => _levelTag;
  // set levelTag(String value) => _levelTag = value;

  // int get unitId => _unitId;
  // set unitId(int value) => _unitId = value;

  // int get internalUnitId => _internalUnitId;
  // set internalUnitId(int value) => _internalUnitId = value;

  // String get unitTitle => _unitTitle;
  // set unitTitle(String value) => _unitTitle = value;

  // int get activityId => _activityId;
  // set activityId(int value) => _activityId = value;

  // int get internalActivityId => _internalActivityId;
  // set internalActivityId(int value) => _internalActivityId = value;

  // String get activityTitle => _activityTitle;
  // set activityTitle(String value) => _activityTitle = value;

  // String get instructions => _instructions;
  // set instructions(String value) => _instructions = value;

  // int get status => _status;
  // set status(int value) => _status = value;

  // String get coverImageUrl => _coverImageUrl;
  // set coverImageUrl(String value) => _coverImageUrl = value;

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
