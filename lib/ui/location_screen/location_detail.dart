import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/model/persons_data/location.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({Key? key, required this.location})
      : super(key: key);

  final Location location;
  String get locationInfo {
    return [
      location.type ?? S.current.noData,
      '·',
      location.dimension ?? S.current.noData,
    ].join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  location.name ?? S.of(context).noData,
                  style: AppStyles.s24w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  locationInfo,
                  style: AppStyles.s18w400.copyWith(
                    color: AppColors.darkSubText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${S.of(context).premiere}: '
                  '${DateFormat('EEEE dd MMMM yyyy').format(location.created!)}',
                  style: AppStyles.s18w400.copyWith(
                    color: AppColors.darkText,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
