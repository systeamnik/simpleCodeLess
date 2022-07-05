import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/service/repo_persons.dart';
import 'package:nursik/ui/persons_screen/view_model/person_screen_view_model.dart';
import 'package:nursik/ui/persons_screen/widgets/persons_page_widget.dart';
import 'package:nursik/ui/settings_screen.dart';
import 'package:provider/provider.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PersonScreenViewModel>();
    final delegate = S.of(context);

    return ChangeNotifierProvider(
      create: (context) => PersonScreenViewModel(
        repo: Provider.of<RepoPersons>(context, listen: false),
      ),
      child: Scaffold(
        backgroundColor: AppColors.screenBackgroundLight,
        body: SafeArea(
          child: PageView(
            controller: model.pageController,
            children: [
              const PersonsPageWidget().create(),
              const SettingsScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: AppStyles.bottomAppBarTitleSize,
          unselectedFontSize: AppStyles.bottomAppBarTitleSize,
          onTap: model.onTapped,
          type: BottomNavigationBarType.fixed,
          currentIndex: model.selectedIndex,
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
      ),
    );
  }
}
