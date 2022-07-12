import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursik/bloc/persons/events_bloc.dart';
import 'package:nursik/bloc/persons/states_bloc.dart';
import 'package:nursik/repo/repo_persons.dart';

class BlocPersons extends Bloc<EventBlocPersons, StateBlocPersons> {
  final RepoPersons repo;

  BlocPersons({
    required this.repo,
  }) : super(StatePersonsInitial()) {
    Timer? searchOnStoppedTyping;

    on<EventPersonsFilterByName>(
      ((event, emit) async {
        final _timer = event.time;
        final _duration = Duration(milliseconds: _timer);

        if (searchOnStoppedTyping != null) {
          if (searchOnStoppedTyping!.isActive) {
            log("cancel timer");
            searchOnStoppedTyping!.cancel();
          }
        }

        searchOnStoppedTyping = Timer(_duration, () async {
          log("searchOnStoppedTyping start");

          await repo.filterByName(event.name).then((value) {
            add(EventReadAll(event.name));
          });
        });
      }),
    );

    on<EventReadAll>((event, emit) async {
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
    });
  }
}
