import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nursik/model/persons_data/location.dart';
part 'persons_data.freezed.dart';
part 'persons_data.g.dart';

@freezed
class PersonsData with _$PersonsData {
  const factory PersonsData({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    Location? origin,
    Location? location,
    String? image,
    List<String>? episode,
    String? url,
    DateTime? created,
  }) = _PersonsData;

  factory PersonsData.fromJson(Map<String, Object?> json) =>
      _$PersonsDataFromJson(json);
}
