import 'package:flutter/material.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/dto/person_data.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key, required this.personsList}) : super(key: key);

  final List<PersonData> personsList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      crossAxisCount: 2,
      mainAxisSpacing: 24.0,
      crossAxisSpacing: 16.0,
      childAspectRatio: 0.9,
      addAutomaticKeepAlives: false,
      children: personsList.map((e) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  AppAssets.images.noAvatar,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              e.status.toUpperCase(),
              style: e.status == 'Живой'
                  ? AppStyles.s10w500StatusLive
                  : AppStyles.s10w500StatusDead,
            ),
            Text(
              e.name,
              style: AppStyles.s14w500,
            ),
            Text(
              e.race + ", " + e.gender,
              style: AppStyles.s12w400,
            ),
          ],
        );
      }).toList(),
    );
  }
}
