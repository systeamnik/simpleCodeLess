import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/service/repo_persons.dart';
import 'package:nursik/ui/persons_screen/widgets/gridview_widget.dart';
import 'package:nursik/ui/persons_screen/widgets/listview_widget.dart';
import 'package:nursik/ui/persons_screen/view_model/person_screen_view_model.dart';
import 'package:nursik/ui/persons_screen/widgets/search_bar_widget.dart';
import 'package:provider/provider.dart';

class PersonsPageWidget extends StatelessWidget {
  const PersonsPageWidget({Key? key}) : super(key: key);

  Widget create() {
    return ChangeNotifierProvider(
      create: (context) => PersonScreenViewModel(
        repo: Provider.of<RepoPersons>(context, listen: false),
      ),
      child: const PersonsPageWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PersonScreenViewModel>();
    final personTotal = model.filteredList.length;
    final delegate = S.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(
              onChange: (String value) {
                model.filter(value.toLowerCase());
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      delegate.personCount.toUpperCase() +
                          ": " +
                          personTotal.toString(),
                      style: AppStyles.s10w500.copyWith(
                        letterSpacing: 1.5,
                        color: AppColors.icon,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      model.switchView();
                    },
                    icon: SvgPicture.asset(
                      model.isListView
                          ? AppAssets.svg.iconList
                          : AppAssets.svg.iconGrid,
                      width: 24,
                      color: AppColors.icon,
                    ),
                  ),
                ],
              ),
            ),
            Consumer<PersonScreenViewModel>(
              builder: ((context, model, _) {
                if (model.isLoading) {
                  return Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                }
                if (model.errorMessage != null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(model.errorMessage!),
                      )
                    ],
                  );
                }
                if (model.filteredList.isEmpty) {
                  return Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(delegate.personsListIsEmpty),
                        )
                      ],
                    ),
                  );
                }
                return Expanded(
                  child: model.isListView
                      ? ListViewWidget(personsList: model.filteredList)
                      : GridViewWidget(personsList: model.filteredList),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
