import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/generated/l10n.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          delegate.settings,
          style: const TextStyle(
            color: AppColors.appBarTitle,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(delegate.language + ': '),
                    DropdownButton<String>(
                      value: Intl.getCurrentLocale(),
                      items: [
                        DropdownMenuItem(
                          value: 'en',
                          child: Text(delegate.english),
                        ),
                        DropdownMenuItem(
                          value: 'ru_RU',
                          child: Text(delegate.russian),
                        ),
                      ],
                      onChanged: (value) async {
                        if (value == 'ru_RU') {
                          await S.load(
                            const Locale('ru', 'RU'),
                          );
                          setState(() {});
                        } else if (value == 'en') {
                          await S.load(
                            const Locale('en'),
                          );
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
