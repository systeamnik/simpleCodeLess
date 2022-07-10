import 'package:nursik/model/persons_data/persons_data.dart';

abstract class StateBlocPersons {}

class StatePersonsInitial extends StateBlocPersons {}

class StatePersonsLoading extends StateBlocPersons {}

class StatePersonsData extends StateBlocPersons {
  StatePersonsData({
    required this.data,
  });
  final List<PersonsData> data;
}

class StatePersonsError extends StateBlocPersons {
  StatePersonsError(this.error);

  final String error;
}
