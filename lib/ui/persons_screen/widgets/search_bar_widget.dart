import 'package:flutter/material.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.formBackground,
        hintText: delegate.findPerson,
        hintStyle: AppStyles.s16w400,
        contentPadding: const EdgeInsets.only(
            left: 15.0, right: 15.0, bottom: 12.0, top: 12.0),
        prefixIcon: const Icon(
          Icons.search,
          size: 24,
          color: AppColors.icon,
        ),
        prefixIconColor: AppColors.icon,
        suffixIcon: const Icon(
          Icons.filter_list_alt,
          size: 24,
          color: AppColors.icon,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: AppColors.formBackground),
          borderRadius: BorderRadius.circular(100),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: AppColors.formBackground),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onChanged: onChange,
    );
  }
}
