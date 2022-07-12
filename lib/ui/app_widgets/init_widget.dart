import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursik/bloc/persons/bloc_persons.dart';
import 'package:nursik/bloc/persons/events_bloc.dart';
import 'package:nursik/repo/api.dart';
import 'package:nursik/repo/repo_persons.dart';
import 'package:nursik/repo/repo_settings.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        RepositoryProvider(
          create: (context) => RepoSettings(),
        ),
        RepositoryProvider(
          create: (context) => RepoPersons(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BlocPersons>(
            create: (context) => BlocPersons(
              repo: RepositoryProvider.of(context),
            )..add(EventReadAll('')),
          )
        ],
        child: child,
      ),
    );
  }
}
