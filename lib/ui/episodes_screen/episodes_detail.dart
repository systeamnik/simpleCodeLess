import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/model/persons_data/episode_data.dart';

class EpisodeDetail extends StatelessWidget {
  const EpisodeDetail({Key? key, required this.episode}) : super(key: key);
  final EpisodeData episode;

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
                  episode.name ?? S.of(context).noData,
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
                  episode.episode ?? S.of(context).noData,
                  style: AppStyles.s16w400.copyWith(
                    color: AppColors.darkSubText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (episode.created != null)
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${S.of(context).aired}: '
                    '${DateFormat('EEEE dd MMMM yyyy').format(episode.created!)}',
                    style: AppStyles.s16w400,
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
