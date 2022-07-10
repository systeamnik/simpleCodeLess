import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/ui/persons_screen/person_screen.dart';
import 'package:nursik/ui/settings_screen.dart';

class AppNavBarWidget extends StatelessWidget {
  const AppNavBarWidget({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentPage,
      selectedFontSize: AppStyles.bottomAppBarTitleSize,
      unselectedFontSize: AppStyles.bottomAppBarTitleSize,
      items: [
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              AppAssets.svg.iconPerson,
              color: AppColors.primary,
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              AppAssets.svg.iconPerson,
            ),
          ),
          label: S.of(context).character,
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              AppAssets.svg.iconSetting,
              color: AppColors.primary,
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(AppAssets.svg.iconSetting),
          ),
          label: S.of(context).settings,
        ),
      ],
      onTap: (index) {
        if (currentPage == index) return;
        if (index == 0) {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: ((context, animation, secondaryAnimation) =>
                  const PersonScreen()),
            ),
            (route) => false,
          );
        } else if (index == 1) {
          Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: ((context, animation, secondaryAnimation) =>
                    const SettingsScreen()),
              ),
              (route) => false);
        }
      },
    );
  }
}
