import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/ui/app_widgets/alert_dialog_widget.dart';
import 'package:nursik/ui/login_screen/widgets/login_form_widget.dart';
import 'package:nursik/ui/login_screen/widgets/password_form_widget.dart';
import 'package:nursik/ui/persons_screen/person_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String login = '';
  String password = '';
  bool passwordVisible = false;

  void setLogin(String value) {
    setState(() {
      login = value;
    });
  }

  void setPassword(String value) {
    setState(() {
      password = passwordController.text;
    });
  }

  void toggleObscureText(bool value) {
    setState(() {
      passwordVisible = value;
    });
  }

  void authButtonPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    final isValidForm = formKey.currentState?.validate();
    if (isValidForm ?? false) {
      if (login == 'qwerty' && password == '123456ab') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const PersonScreen(),
          ),
          (route) => false,
        );
      } else {
        showAlertDialog(context);
      }
    }
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: SafeArea(
            child: bodyWidgets(context),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView bodyWidgets(BuildContext context) {
    final delegate = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Image.asset(
                  AppAssets.images.logo,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      delegate.login,
                      style: AppStyles.s14w400,
                    ),
                  ),
                  LoginFormWidget(
                    callback: setLogin,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: Text(
                      delegate.password,
                      style: AppStyles.s14w400,
                    ),
                  ),
                  PasswordFormWidget(
                    passwordController: passwordController,
                    callBackObscureText: toggleObscureText,
                    obscureTextIsVisible: passwordVisible,
                    callback: setPassword,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        authButtonPressed(context);
                      },
                      style: AppStyles.buttomStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                delegate.signIn,
                                style: AppStyles.s16w400button,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        delegate.dontHaveAccount,
                        style: const TextStyle(
                          color: AppColors.icon,
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          delegate.createAccount,
                          style: const TextStyle(
                            color: AppColors.linkText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
