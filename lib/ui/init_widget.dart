import 'package:flutter/material.dart';
import 'package:nursik/service/repo_persons.dart';
import 'package:nursik/service/repo_settings.dart';
import 'package:provider/provider.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => RepoSettings(),
        ),
        Provider(
          create: (context) => RepoPersons(),
        ),
      ],
      child: child,
    );
  }
}
