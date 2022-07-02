import 'package:json_annotation/json_annotation.dart';
import 'package:nursik/model/persons_data/location.dart';
part 'persons_data.g.dart';

@JsonSerializable()
class PersonsData {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final Location? origin;
  final Location? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final DateTime? created;

  PersonsData({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory PersonsData.fromJson(Map<String, dynamic> json) =>
      _$PersonsDataFromJson(json);

  Map<String, dynamic> toJson() => _$PersonsDataToJson(this);
}
