import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nursik/model/persons_data/location.dart';
part 'states_bloc.freezed.dart';

@freezed
class StateBlocLocations with _$StateBlocLocations {
  const factory StateBlocLocations.initial() = StateLocationInitial;
  const factory StateBlocLocations.loading() = StateLocationLoading;
  const factory StateBlocLocations.data({required List<Location> data}) =
      StateLocationData;
  const factory StateBlocLocations.error(String error) = StateLocationsError;
}
