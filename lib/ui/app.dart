import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/ui/init_widget.dart';
import 'package:nursik/ui/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.locale,
  }) : super(key: key);
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: locale,
        supportedLocales: S.delegate.supportedLocales,
        home: const SplashScreen(),
      ),
    );
  }
}
