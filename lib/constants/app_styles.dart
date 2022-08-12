import 'package:flutter/material.dart';
import 'package:nursik/constants/app_colors.dart';

class AppStyles {
  static const s10w500 = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
    color: AppColors.header,
  );

  static const s10w500StatusLive = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
    color: AppColors.avatarStatusLive,
  );

  static const s10w500StatusDead = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
    color: AppColors.avatarStatusDead,
  );

  static const s14w500 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.avatarTitle,
  );

  static const s14w400 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.formInputTitle,
  );

  static const s12w400 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.avatarSubTitle,
  );

  static const s16w400 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.formPlacehorder,
  );

  static const s16w500 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.avatarTitle,
  );

  static const s18w400 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );

  static const s18w500 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  static const s20w500 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: AppColors.formInputTitle,
    letterSpacing: 0.15,
  );
  static const s24w400 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    color: AppColors.formInputTitle,
    letterSpacing: 0.15,
  );
  static const s24w500 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: AppColors.formInputTitle,
    letterSpacing: 0.15,
  );

  static const s16w400button = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.formInputLightText,
    letterSpacing: 0.15,
  );

  static const bottomAppBarTitleSize = 12.0;

  static ButtonStyle buttomStyle = ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(AppColors.buttonBackground),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );

  static ButtonStyle buttomStyleRounded = OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    side: const BorderSide(
      width: 1,
      color: AppColors.buttonBackground,
    ),
  );
}
