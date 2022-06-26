import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/dto/person_data.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/ui/persons_screen/widgets/gridview_widget.dart';
import 'package:nursik/ui/persons_screen/widgets/listview_widget.dart';
import 'package:nursik/ui/persons_screen/widgets/search_bar_widget.dart';

class PersonsPageWidget extends StatefulWidget {
  const PersonsPageWidget({Key? key}) : super(key: key);

  @override
  State<PersonsPageWidget> createState() => _PersonsPageWidgetState();
}

class _PersonsPageWidgetState extends State<PersonsPageWidget> {
  bool isListView = true;
  final personsList = [
    PersonData('', 'Живой', 'Рик Cанчез', 'Человек', 'Мужской'),
    PersonData('', 'Живой', 'Директор Агентстваз', 'Человек', 'Мужской'),
    PersonData('', 'Живой', 'Морти Смит', 'Человек', 'Мужской'),
    PersonData('', 'Живой', 'Саммер Смит', 'Человек', 'Женский'),
    PersonData('', 'Мертвый', 'Альберт Эйнштейн', 'Человек', 'Мужской'),
    PersonData('', 'Мертвый', 'Алан Райлс', 'Человек', 'Мужской'),
  ];

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBarWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    delegate.personCount.toUpperCase() +
                        ": " +
                        personsList.length.toString(),
                    style: AppStyles.s10w500,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isListView = !isListView;
                    });
                  },
                  icon: SvgPicture.asset(
                    isListView
                        ? AppAssets.svg.iconList
                        : AppAssets.svg.iconGrid,
                    width: 24,
                    color: AppColors.icon,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: isListView
                ? ListViewWidget(personsList: personsList)
                : GridViewWidget(personsList: personsList),
          ),
        ],
      ),
    );
  }
}
