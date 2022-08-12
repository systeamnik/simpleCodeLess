import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nursik/model/persons_data/persons_data.dart';
part 'states_bloc.freezed.dart';

@freezed
class StateBlocPersons with _$StateBlocPersons {
  const factory StateBlocPersons.initial() = StatePersonsInitial;
  const factory StateBlocPersons.loading() = StatePersonsLoading;
  const factory StateBlocPersons.data({required List<PersonsData> data}) =
      StatePersonsData;
  const factory StateBlocPersons.error(String error) = StatePersonsError;
}
