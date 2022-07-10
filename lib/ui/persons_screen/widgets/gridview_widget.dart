import 'package:flutter/material.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/model/persons_data/persons_data.dart';
import 'package:nursik/ui/app_widgets/user_avatar_widget.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key, required this.personsList}) : super(key: key);

  final List<PersonsData> personsList;

  Color _statusColor(String? status) {
    if (status == 'Dead') return AppColors.avatarStatusDead;
    if (status == 'Alive') return AppColors.avatarStatusLive;
    return Colors.grey;
  }

  String _statusLabel(String? status) {
    if (status == 'Dead') return S.current.dead;
    if (status == 'Alive') return S.current.live;
    return S.current.noData;
  }

  String _personSpecies(String? species) {
    if (species == 'Human') return S.current.human;
    if (species == 'Alien') return S.current.alien;
    return S.current.unknown;
  }

  String _personGender(String? gender) {
    if (gender == 'Male') return S.current.man;
    if (gender == 'Female') return S.current.woman;
    return S.current.unknown;
  }

  @override
  Widget build(BuildContext context) {
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
              _statusLabel(person.status).toUpperCase(),
              style: AppStyles.s10w500.copyWith(
                color: _statusColor(person.status),
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
              _personSpecies(person.species) +
                  ", " +
                  _personGender(person.gender),
              style: AppStyles.s12w400,
            ),
          ],
        );
      }).toList(),
    );
  }
}
