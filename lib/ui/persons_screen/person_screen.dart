import 'package:flutter/material.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/ui/persons_screen/gridview_widget.dart';
import 'package:nursik/ui/persons_screen/listview_widget.dart';
import 'package:nursik/ui/persons_screen/search_bar_widget.dart';

class PersonData {
  PersonData(
    this.avatar,
    this.status,
    this.name,
    this.race,
    this.gender,
  );

  final String avatar;
  final String gender;
  final String name;
  final String race;
  final String status;
}

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PersonList(),
      ),
      backgroundColor: AppColors.screenBackgroundLight,
    );
  }
}

class PersonList extends StatefulWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
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
                  icon: Icon(
                    isListView ? Icons.list_sharp : Icons.grid_view_rounded,
                    size: 24,
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
