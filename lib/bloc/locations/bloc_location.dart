import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursik/bloc/locations/events_bloc.dart';
import 'package:nursik/bloc/locations/states_bloc.dart';
import 'package:nursik/repo/repo_locations.dart';

class BlocLocations extends Bloc<EventBlocLocations, StateBlocLocations> {
  final RepoLocations repo;

  BlocLocations({
    required this.repo,
  }) : super(const StateBlocLocations.initial()) {
    Timer? timer;

    on<EventLocationsFilterByName>(
      ((event, emit) async {
        final _timer = event.time;
        final _duration = Duration(milliseconds: _timer);

        if (timer != null) {
          if (timer!.isActive) {
            timer!.cancel();
          }
        }

        timer = Timer(_duration, () async {
          log("searchOnStoppedTyping start");

          await repo.filterByName(event.name).then((value) {
            // emit(StatePersonsLoading());

            add(EventLocationsAll(event.name));
          });
        });
      }),
    );

    on<EventLocationsAll>((event, emit) async {
      emit(const StateLocationLoading());

      final result = await repo.filterByName(event.name);
      if (result.errorMessage != null) {
        emit(
          StateLocationsError(result.errorMessage!),
        );
        return;
      }
      emit(
        StateLocationData(data: result.locationsList!),
      );
    });
  }
}
