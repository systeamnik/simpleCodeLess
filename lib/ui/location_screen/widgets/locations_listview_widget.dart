import 'package:flutter/material.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/model/persons_data/location.dart';
import 'package:nursik/ui/location_screen/location_detail.dart';

class LocationListViewWidget extends StatelessWidget {
  const LocationListViewWidget({
    Key? key,
    required this.locationsList,
  }) : super(key: key);

  final List<Location> locationsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: locationsList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20);
      },
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locationsList[index].type!,
                  style: AppStyles.s16w400.copyWith(
                    color: AppColors.header,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  locationsList[index].name!,
                  style: AppStyles.s16w500,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                locationsList[index].dimension!,
                style: AppStyles.s14w400.copyWith(
                  color: AppColors.header,
                ),
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LocationDetailScreen(
                    location: locationsList[index],
                  ),
                ),
              );
            },
          ),
        );
        // return Card(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        // Text(
        //   locationsList[index].type!,
        //   style: AppStyles.s16w400.copyWith(
        //     color: AppColors.header,
        //   ),
        // ),
        // const SizedBox(height: 5),
        // Text(
        //   locationsList[index].name!,
        //   style: AppStyles.s16w500,
        //   overflow: TextOverflow.fade,
        //   maxLines: 1,
        //   softWrap: false,
        // ),
        //       const SizedBox(height: 5),
        // Text(
        //   locationsList[index].dimension!,
        //   style: AppStyles.s14w400.copyWith(
        //     color: AppColors.header,
        //   ),
        // ),
        //     ],
        //   ),
        // );
      },
    );
  }
}
