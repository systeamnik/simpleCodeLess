import 'package:flutter/material.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/model/persons_data/persons_data.dart';
import 'package:nursik/ui/app_widgets/user_avatar_widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.personsList,
  }) : super(key: key);

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
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _statusLabel(personsList[index].status).toUpperCase(),
                  style: AppStyles.s10w500.copyWith(
                    color: _statusColor(personsList[index].status),
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  personsList[index].name!,
                  style: AppStyles.s16w500,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
                const SizedBox(height: 7),
                Text(
                  _personSpecies(personsList[index].species) +
                      ", " +
                      _personGender(personsList[index].gender),
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
