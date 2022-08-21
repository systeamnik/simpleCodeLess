// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'episode_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeData _$EpisodeDataFromJson(Map<String, dynamic> json) {
  return _EpisodeData.fromJson(json);
}

/// @nodoc
mixin _$EpisodeData {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'air_date')
  String? get airDate => throw _privateConstructorUsedError;
  String? get episode => throw _privateConstructorUsedError;
  List<String?> get characters =>
      throw _privateConstructorUsedError; // List<String>? characters,
  String? get url => throw _privateConstructorUsedError;
  DateTime? get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeDataCopyWith<EpisodeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeDataCopyWith<$Res> {
  factory $EpisodeDataCopyWith(
          EpisodeData value, $Res Function(EpisodeData) then) =
      _$EpisodeDataCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'air_date') String? airDate,
      String? episode,
      List<String?> characters,
      String? url,
      DateTime? created});
}

/// @nodoc
class _$EpisodeDataCopyWithImpl<$Res> implements $EpisodeDataCopyWith<$Res> {
  _$EpisodeDataCopyWithImpl(this._value, this._then);

  final EpisodeData _value;
  // ignore: unused_field
  final $Res Function(EpisodeData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? airDate = freezed,
    Object? episode = freezed,
    Object? characters = freezed,
    Object? url = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      airDate: airDate == freezed
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String?,
      characters: characters == freezed
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_EpisodeDataCopyWith<$Res>
    implements $EpisodeDataCopyWith<$Res> {
  factory _$$_EpisodeDataCopyWith(
          _$_EpisodeData value, $Res Function(_$_EpisodeData) then) =
      __$$_EpisodeDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'air_date') String? airDate,
      String? episode,
      List<String?> characters,
      String? url,
      DateTime? created});
}

/// @nodoc
class __$$_EpisodeDataCopyWithImpl<$Res> extends _$EpisodeDataCopyWithImpl<$Res>
    implements _$$_EpisodeDataCopyWith<$Res> {
  __$$_EpisodeDataCopyWithImpl(
      _$_EpisodeData _value, $Res Function(_$_EpisodeData) _then)
      : super(_value, (v) => _then(v as _$_EpisodeData));

  @override
  _$_EpisodeData get _value => super._value as _$_EpisodeData;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? airDate = freezed,
    Object? episode = freezed,
    Object? characters = freezed,
    Object? url = freezed,
    Object? created = freezed,
  }) {
    return _then(_$_EpisodeData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      airDate: airDate == freezed
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String?,
      characters: characters == freezed
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeData implements _EpisodeData {
  const _$_EpisodeData(
      {this.id,
      this.name,
      @JsonKey(name: 'air_date') this.airDate,
      this.episode,
      final List<String?> characters = const [],
      this.url,
      this.created})
      : _characters = characters;

  factory _$_EpisodeData.fromJson(Map<String, dynamic> json) =>
      _$$_EpisodeDataFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'air_date')
  final String? airDate;
  @override
  final String? episode;
  final List<String?> _characters;
  @override
  @JsonKey()
  List<String?> get characters {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

// List<String>? characters,
  @override
  final String? url;
  @override
  final DateTime? created;

  @override
  String toString() {
    return 'EpisodeData(id: $id, name: $name, airDate: $airDate, episode: $episode, characters: $characters, url: $url, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.airDate, airDate) &&
            const DeepCollectionEquality().equals(other.episode, episode) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.created, created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(airDate),
      const DeepCollectionEquality().hash(episode),
      const DeepCollectionEquality().hash(_characters),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(created));

  @JsonKey(ignore: true)
  @override
  _$$_EpisodeDataCopyWith<_$_EpisodeData> get copyWith =>
      __$$_EpisodeDataCopyWithImpl<_$_EpisodeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeDataToJson(this);
  }
}

abstract class _EpisodeData implements EpisodeData {
  const factory _EpisodeData(
      {final int? id,
      final String? name,
      @JsonKey(name: 'air_date') final String? airDate,
      final String? episode,
      final List<String?> characters,
      final String? url,
      final DateTime? created}) = _$_EpisodeData;

  factory _EpisodeData.fromJson(Map<String, dynamic> json) =
      _$_EpisodeData.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'air_date')
  String? get airDate;
  @override
  String? get episode;
  @override
  List<String?> get characters;
  @override // List<String>? characters,
  String? get url;
  @override
  DateTime? get created;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeDataCopyWith<_$_EpisodeData> get copyWith =>
      throw _privateConstructorUsedError;
}
