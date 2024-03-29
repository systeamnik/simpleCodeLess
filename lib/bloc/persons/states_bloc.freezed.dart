// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'states_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StateBlocPersons {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PersonsData> data) data,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PersonsData> data)? data,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PersonsData> data)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatePersonsInitial value) initial,
    required TResult Function(StatePersonsLoading value) loading,
    required TResult Function(StatePersonsData value) data,
    required TResult Function(StatePersonsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StatePersonsInitial value)? initial,
    TResult Function(StatePersonsLoading value)? loading,
    TResult Function(StatePersonsData value)? data,
    TResult Function(StatePersonsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatePersonsInitial value)? initial,
    TResult Function(StatePersonsLoading value)? loading,
    TResult Function(StatePersonsData value)? data,
    TResult Function(StatePersonsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateBlocPersonsCopyWith<$Res> {
  factory $StateBlocPersonsCopyWith(
          StateBlocPersons value, $Res Function(StateBlocPersons) then) =
      _$StateBlocPersonsCopyWithImpl<$Res>;
}

/// @nodoc
class _$StateBlocPersonsCopyWithImpl<$Res>
    implements $StateBlocPersonsCopyWith<$Res> {
  _$StateBlocPersonsCopyWithImpl(this._value, this._then);

  final StateBlocPersons _value;
  // ignore: unused_field
  final $Res Function(StateBlocPersons) _then;
}

/// @nodoc
abstract class _$$StatePersonsInitialCopyWith<$Res> {
  factory _$$StatePersonsInitialCopyWith(_$StatePersonsInitial value,
          $Res Function(_$StatePersonsInitial) then) =
      __$$StatePersonsInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatePersonsInitialCopyWithImpl<$Res>
    extends _$StateBlocPersonsCopyWithImpl<$Res>
    implements _$$StatePersonsInitialCopyWith<$Res> {
  __$$StatePersonsInitialCopyWithImpl(
      _$StatePersonsInitial _value, $Res Function(_$StatePersonsInitial) _then)
      : super(_value, (v) => _then(v as _$StatePersonsInitial));

  @override
  _$StatePersonsInitial get _value => super._value as _$StatePersonsInitial;
}

/// @nodoc

class _$StatePersonsInitial implements StatePersonsInitial {
  const _$StatePersonsInitial();

  @override
  String toString() {
    return 'StateBlocPersons.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatePersonsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PersonsData> data) data,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PersonsData> data)? data,
    TResult Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PersonsData> data)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatePersonsInitial value) initial,
    required TResult Function(StatePersonsLoading value) loading,
    required TResult Function(StatePersonsData value) data,
    required TResult Function(StatePersonsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StatePersonsInitial value)? initial,
    TResult Function(StatePersonsLoading value)? loading,
    TResult Function(StatePersonsData value)? data,
    TResult Function(StatePersonsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatePersonsInitial value)? initial,
    TResult Function(StatePersonsLoading value)? loading,
    TResult Function(StatePersonsData value)? data,
    TResult Function(StatePersonsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class StatePersonsInitial implements StateBlocPersons {
  const factory StatePersonsInitial() = _$StatePersonsInitial;
}

/// @nodoc
abstract class _$$StatePersonsLoadingCopyWith<$Res> {
  factory _$$StatePersonsLoadingCopyWith(_$StatePersonsLoading value,
          $Res Function(_$StatePersonsLoading) then) =
      __$$StatePersonsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatePersonsLoadingCopyWithImpl<$Res>
    extends _$StateBlocPersonsCopyWithImpl<$Res>
    implements _$$StatePersonsLoadingCopyWith<$Res> {
  __$$StatePersonsLoadingCopyWithImpl(
      _$StatePersonsLoading _value, $Res Function(_$StatePersonsLoading) _then)
      : super(_value, (v) => _then(v as _$StatePersonsLoading));

  @override
  _$StatePersonsLoading get _value => super._value as _$StatePersonsLoading;
}

/// @nodoc

class _$StatePersonsLoading implements StatePersonsLoading {
  const _$StatePersonsLoading();

  @override
  String toString() {
    return 'StateBlocPersons.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatePersonsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PersonsData> data) data,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PersonsData> data)? data,
    TResult Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PersonsData> data)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatePersonsInitial value) initial,
    required TResult Function(StatePersonsLoading value) loading,
    required TResult Function(StatePersonsData value) data,
    required TResult Function(StatePersonsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StatePersonsInitial value)? initial,
    TResult Function(StatePersonsLoading value)? loading,
    TResult Function(StatePersonsData value)? data,
    TResult Function(StatePersonsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatePersonsInitial value)? initial,
    TResult Function(StatePersonsLoading value)? loading,
    TResult Function(StatePersonsData value)? data,
    TResult Function(StatePersonsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StatePersonsLoading implements StateBlocPersons {
  const factory StatePersonsLoading() = _$StatePersonsLoading;
}

/// @nodoc
abstract class _$$StatePersonsDataCopyWith<$Res> {
  factory _$$StatePersonsDataCopyWith(
          _$StatePersonsData value, $Res Function(_$StatePersonsData) then) =
      __$$StatePersonsDataCopyWithImpl<$Res>;
  $Res call({List<PersonsData> data});
}

/// @nodoc
class __$$StatePersonsDataCopyWithImpl<$Res>
    extends _$StateBlocPersonsCopyWithImpl<$Res>
    implements _$$StatePersonsDataCopyWith<$Res> {
  __$$StatePersonsDataCopyWithImpl(
      _$StatePersonsData _value, $Res Function(_$StatePersonsData) _then)
      : super(_value, (v) => _then(v as _$StatePersonsData));

  @override
  _$StatePersonsData get _value => super._value as _$StatePersonsData;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$StatePersonsData(
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PersonsData>,
    ));
  }
}

/// @nodoc

class _$StatePersonsData implements StatePersonsData {
  const _$StatePersonsData({required final List<PersonsData> data})
      : _data = data;

  final List<PersonsData> _data;
  @override
  List<PersonsData> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'StateBlocPersons.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatePersonsData &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$StatePersonsDataCopyWith<_$StatePersonsData> get copyWith =>
      __$$StatePersonsDataCopyWithImpl<_$StatePersonsData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PersonsData> data) data,
    required TResult Function(String error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PersonsData> data)? data,
    TResult Function(String error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PersonsData> data)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatePersonsInitial value) initial,
    required TResult Function(StatePersonsLoading value) loading,
    required TResult Function(StatePersonsData value) data,
    required TResult Function(StatePersonsError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StatePersonsInitial value)? initial,
    TResult Function(StatePersonsLoading value)? loading,
    TResult Function(StatePersonsData value)? data,
    TResult Function(StatePersonsError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatePersonsInitial value)? initial,
    TResult Function(StatePersonsLoading value)? loading,
    TResult Function(StatePersonsData value)? data,
    TResult Function(StatePersonsError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class StatePersonsData implements StateBlocPersons {
  const factory StatePersonsData({required final List<PersonsData> data}) =
      _$StatePersonsData;

  List<PersonsData> get data;
  @JsonKey(ignore: true)
  _$$StatePersonsDataCopyWith<_$StatePersonsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatePersonsErrorCopyWith<$Res> {
  factory _$$StatePersonsErrorCopyWith(
          _$StatePersonsError value, $Res Function(_$StatePersonsError) then) =
      __$$StatePersonsErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$StatePersonsErrorCopyWithImpl<$Res>
    extends _$StateBlocPersonsCopyWithImpl<$Res>
    implements _$$StatePersonsErrorCopyWith<$Res> {
  __$$StatePersonsErrorCopyWithImpl(
      _$StatePersonsError _value, $Res Function(_$StatePersonsError) _then)
      : super(_value, (v) => _then(v as _$StatePersonsError));

  @override
  _$StatePersonsError get _value => super._value as _$StatePersonsError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$StatePersonsError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StatePersonsError implements StatePersonsError {
  const _$StatePersonsError(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'StateBlocPersons.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatePersonsError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$StatePersonsErrorCopyWith<_$StatePersonsError> get copyWith =>
      __$$StatePersonsErrorCopyWithImpl<_$StatePersonsError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PersonsData> data) data,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PersonsData> data)? data,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PersonsData> data)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatePersonsInitial value) initial,
    required TResult Function(StatePersonsLoading value) loading,
    required TResult Function(StatePersonsData value) data,
    required TResult Function(StatePersonsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StatePersonsInitial value)? initial,
    TResult Function(StatePersonsLoading value)? loading,
    TResult Function(StatePersonsData value)? data,
    TResult Function(StatePersonsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatePersonsInitial value)? initial,
    TResult Function(StatePersonsLoading value)? loading,
    TResult Function(StatePersonsData value)? data,
    TResult Function(StatePersonsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class StatePersonsError implements StateBlocPersons {
  const factory StatePersonsError(final String error) = _$StatePersonsError;

  String get error;
  @JsonKey(ignore: true)
  _$$StatePersonsErrorCopyWith<_$StatePersonsError> get copyWith =>
      throw _privateConstructorUsedError;
}
