import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/generated/l10n.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  // void setLogin(String value)
  final void Function(String value) callback;

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    return TextFormField(
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
      onChanged: callback,
    );
  }
}
