import 'package:freezed_annotation/freezed_annotation.dart';
part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    String? name,
    String? type,
    String? dimension,
    List<String>? residents,
    String? url,
    DateTime? created,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);

  // Map<String, dynamic> toJson() => _$LocationToJson(this);
}
