import 'package:flutter/material.dart';
import 'package:nursik/ui/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String login = '';
  String password = '';

  void setLogin(String value) {
    setState(() {
      login = value;
    });
  }

  void setPassword(String value) {
    setState(() {
      password = value;
    });
  }

  void authButtonPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    final isValidForm = formKey.currentState?.validate();
    if (isValidForm == null) return;
    if (isValidForm) {
      if (login == 'qwerty' && password == '123456ab') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Попробуйте снова"),
              content: const Text("Логин и пароль не верный"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Закрыть"),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Авторизация"),
        ),
        body: bodyWidgets(context),
      ),
    );
  }

  Padding bodyWidgets(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "Введите логин и пароль",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              maxLength: 8,
              decoration: const InputDecoration(
                hintText: 'Логин',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty || value.length < 4) {
                  return 'Логин должен содержать не менее 3 символов';
                }
                return null;
              },
              onChanged: (value) {
                setLogin(value);
              },
            ),
            TextFormField(
              maxLength: 16,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Пароль',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty || value.length < 8) {
                  return 'Пароль должен содержать не менее 8 символов';
                }
                return null;
              },
              onChanged: (value) {
                setPassword(value);
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                authButtonPressed(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Вход"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
