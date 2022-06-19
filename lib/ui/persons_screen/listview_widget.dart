import 'package:flutter/material.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/ui/persons_screen/person_screen.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.personsList,
  }) : super(key: key);

  final List<PersonData> personsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: personsList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 24);
      },
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            SizedBox(
              width: 74,
              height: 74,
              child: CircleAvatar(
                backgroundImage: AssetImage(AppAssets.images.noAvatar),
              ),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  personsList[index].status.toUpperCase(),
                  style: personsList[index].status == 'Живой'
                      ? AppStyles.s10w500StatusLive
                      : AppStyles.s10w500StatusDead,
                ),
                Text(
                  personsList[index].name,
                  style: AppStyles.s16w500,
                ),
                Text(
                  personsList[index].race + ", " + personsList[index].gender,
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
