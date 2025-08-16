import 'package:codehatch/utils/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inbox_model.freezed.dart';
part 'inbox_model.g.dart';

class JobStatusConverter implements JsonConverter<JobStatus, String> {
  const JobStatusConverter();

  @override
  JobStatus fromJson(String json) {
    return JobStatus.values.firstWhere(
      (e) => e.displayName == json,
      orElse: () => JobStatus.inProgress,
    );
  }

  @override
  String toJson(JobStatus jobStatus) => jobStatus.displayName;
}

@freezed
abstract class InboxModel with _$InboxModel {
  const factory InboxModel({
    required String id,
    required String title,
    required String workplace,
    required String logoUrl,
    required String message,
    required String deadline,
    @JobStatusConverter() required JobStatus jobStatus,
  }) = _InboxModel;

  factory InboxModel.fromJson(Map<String, dynamic> json) =>
      _$InboxModelFromJson(json);
}
