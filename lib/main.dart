import 'package:flutter/material.dart';
import 'package:nursik/service/repo_settings.dart';
import 'package:nursik/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repoSettings = RepoSettings();
  await repoSettings.init();
  var defaultLocale = const Locale('ru', 'RU');
  final locale = await repoSettings.readLocale();

  if (locale == 'en') {
    defaultLocale = const Locale('en');
  }

  runApp(
    MyApp(locale: defaultLocale),
  );
}
