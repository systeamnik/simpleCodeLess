import 'package:flutter/material.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/model/persons_data/persons_data.dart';
import 'package:nursik/ui/app_widgets/user_avatar_widget.dart';
import 'package:nursik/ui/persons_screen/view_model/person_screen_view_model.dart';
import 'package:provider/provider.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key, required this.personsList}) : super(key: key);

  final List<PersonsData> personsList;

  @override
  Widget build(BuildContext context) {
    final model = context.read<PersonScreenViewModel>();
    return GridView.count(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      crossAxisCount: 2,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 0.0,
      childAspectRatio: 0.85,
      addAutomaticKeepAlives: false,
      children: personsList.map((person) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.32,
              height: MediaQuery.of(context).size.width * 0.32,
              child: UserAvatarWidget(
                radius: MediaQuery.of(context).size.width * 0.12,
                url: person.image,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              model.statusLabel(person.status).toUpperCase(),
              style: AppStyles.s10w500.copyWith(
                color: model.statusColor(person.status),
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              person.name!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.s14w500,
            ),
            const SizedBox(height: 2),
            Text(
              model.personSpecies(person.species) +
                  ", " +
                  model.personGender(person.gender),
              style: AppStyles.s12w400,
            ),
          ],
        );
      }).toList(),
    );
  }
}
