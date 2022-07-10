import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursik/bloc/persons/events_bloc.dart';
import 'package:nursik/bloc/persons/states_bloc.dart';
import 'package:nursik/repo/repo_persons.dart';

class BlocPersons extends Bloc<EventBlocPersons, StateBlocPersons> {
  final RepoPersons repo;

  BlocPersons({
    required this.repo,
  }) : super(StatePersonsInitial()) {
    on<EventPersonsFilterByName>(
      ((event, emit) async {
        emit(StatePersonsLoading());
        final result = await repo.filterByName(event.name);
        if (result.errorMessage != null) {
          emit(
            StatePersonsError(result.errorMessage!),
          );
          return;
        }
        emit(
          StatePersonsData(data: result.personsList!),
        );
      }),
    );
  }
}
