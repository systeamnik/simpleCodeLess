import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nursik/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(delegate.mainScreenTitle),
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
                const Spacer(),
                Text(
                  // 'Значение счетчика:',
                  delegate.counterValue,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline3,
                ),
                const Spacer(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text(
                  "+",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _decrementCounter,
                child: const Text(
                  "-",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
