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

  static const s16w500 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.avatarTitle,
  );

  static const s14w500 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.avatarTitle,
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
}
