import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/ui/persons_screen/widgets/persons_page_widget.dart';
import 'package:nursik/ui/settings_screen.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundLight,
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: const [
            PersonsPageWidget(),
            SettingsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: AppStyles.bottomAppBarTitleSize,
        unselectedFontSize: AppStyles.bottomAppBarTitleSize,
        onTap: onTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
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
            label: delegate.character,
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
            label: delegate.settings,
          ),
        ],
      ),
    );
  }
}
