import 'package:flutter/material.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/dto/person_data.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.personsList,
  }) : super(key: key);

  final List<PersonData> personsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: personsList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * .12,
              backgroundImage: AssetImage(AppAssets.images.noAvatar),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  personsList[index].status.toUpperCase(),
                  style: personsList[index].status == 'Живой'
                      ? AppStyles.s10w500StatusLive
                      : AppStyles.s10w500StatusDead,
                ),
                const SizedBox(height: 7),
                Text(
                  personsList[index].name,
                  style: AppStyles.s16w500,
                ),
                const SizedBox(height: 7),
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
