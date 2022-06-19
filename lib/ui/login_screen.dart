import 'package:flutter/material.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/ui/persons_screen/person_screen.dart';

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
            builder: (context) => const PersonScreen(),
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
          title: Text(S.of(context).auth),
        ),
        body: bodyWidgets(context),
      ),
    );
  }

  Padding bodyWidgets(BuildContext context) {
    final delegate = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              delegate.inputLoginAndPassword,
              // "Введите логин и пароль",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              maxLength: 8,
              decoration: InputDecoration(
                hintText: delegate.login,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty || value.length < 4) {
                  return delegate.inputErrorLoginInShort;
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
              decoration: InputDecoration(
                hintText: delegate.password,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty || value.length < 8) {
                  return delegate.inputErrorPasswordInShort;
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
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        delegate.signIn,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
