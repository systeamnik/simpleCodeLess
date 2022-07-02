import 'package:flutter/material.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/model/persons_data/persons_data.dart';
import 'package:nursik/ui/app_widgets/user_avatar_widget.dart';
import 'package:nursik/ui/persons_screen/view_model/person_screen_view_model.dart';
import 'package:provider/provider.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.personsList,
  }) : super(key: key);

  final List<PersonsData> personsList;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PersonScreenViewModel>();
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: personsList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20);
      },
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            UserAvatarWidget(
              radius: MediaQuery.of(context).size.width * 0.10,
              url: personsList[index].image,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.statusLabel(personsList[index].status).toUpperCase(),
                  style: AppStyles.s10w500.copyWith(
                    color: model.statusColor(personsList[index].status),
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  personsList[index].name!,
                  style: AppStyles.s16w500,
                ),
                const SizedBox(height: 7),
                Text(
                  model.personSpecies(personsList[index].species) +
                      ", " +
                      model.personGender(personsList[index].gender),
                  style: AppStyles.s12w400,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
