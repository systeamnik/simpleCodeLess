// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'episode_data.freezed.dart';
part 'episode_data.g.dart';

@freezed
class EpisodeData with _$EpisodeData {
  const factory EpisodeData({
    int? id,
    String? name,
    @JsonKey(name: 'air_date') String? airDate,
    String? episode,
    @Default([]) List<String?> characters,
    // List<String>? characters,
    String? url,
    DateTime? created,
  }) = _EpisodeData;

  factory EpisodeData.fromJson(Map<String, Object?> json) =>
      _$EpisodeDataFromJson(json);

  // Map<String, dynamic> toJson() => _$LocationToJson(this);
}
