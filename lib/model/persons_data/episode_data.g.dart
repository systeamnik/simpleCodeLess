// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EpisodeData _$$_EpisodeDataFromJson(Map<String, dynamic> json) =>
    _$_EpisodeData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      airDate: json['air_date'] as String?,
      episode: json['episode'] as String?,
      characters: (json['characters'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      url: json['url'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$_EpisodeDataToJson(_$_EpisodeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.airDate,
      'episode': instance.episode,
      'characters': instance.characters,
      'url': instance.url,
      'created': instance.created?.toIso8601String(),
    };
