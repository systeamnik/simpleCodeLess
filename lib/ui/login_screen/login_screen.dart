import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
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
      password = value;
    });
  }

  void authButtonPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    final isValidForm = formKey.currentState?.validate();
    if (isValidForm == null) return;
    if (isValidForm) {
      if (login == 'qwerty' && password == '123456ab') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const PersonScreen(),
          ),
          (route) => false,
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              contentPadding: const EdgeInsets.all(30.0),
              title: Text(
                S.of(context).error,
                style: AppStyles.s20w500,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).authErrorMessage,
                    style: AppStyles.s14w400,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      style: AppStyles.buttomStyleRounded,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                S.of(context).ok,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
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
                  TextFormField(
                    maxLength: 8,
                    decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: SvgPicture.asset(
                          AppAssets.svg.iconAccount,
                          color: AppColors.icon,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.formBackground,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
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
                  TextFormField(
                    controller: passwordController,
                    maxLength: 16,
                    obscureText: !passwordVisible,
                    style: const TextStyle(
                      letterSpacing: 4.0,
                    ),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        letterSpacing: 0,
                      ),
                      counterText: "",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: SvgPicture.asset(
                          AppAssets.svg.iconPassword,
                          color: AppColors.icon,
                        ),
                      ),
                      suffixIcon: passwordController.text.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                child: Icon(
                                  passwordVisible
                                      ? Icons.remove_red_eye_rounded
                                      : Icons.remove_red_eye_outlined,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      filled: true,
                      fillColor: AppColors.formBackground,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
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
