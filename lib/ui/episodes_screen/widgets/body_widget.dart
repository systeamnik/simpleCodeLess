import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursik/bloc/episodes/bloc_episodes.dart';
import 'package:nursik/bloc/episodes/events_bloc.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/model/persons_data/episode_data.dart';
import 'package:nursik/ui/episodes_screen/episodes_detail.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key, required this.data}) : super(key: key);

  final List<EpisodeData> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              S.of(context).episodesListIsEmpty,
            ),
          ),
        ],
      );
    } else {
      return RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<BlocEpisodes>(context).add(
            EventEpisodesFetch(),
          );
        },
        child: NotificationListener(
          onNotification: (notification) {
            if (notification is ScrollNotification) {
              if (notification.metrics.extentAfter == 0) {
                BlocProvider.of<BlocEpisodes>(context).add(
                  EventEpisodesNextPage(),
                );
              }
            }
            return false;
          },
          child: ListView.separated(
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 12.0,
              right: 12.0,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) =>
                EpisodeWidget(context, data[index]),
            separatorBuilder: (context, _) => const SizedBox(height: 10),
          ),
        ),
      );
    }
  }
}

Widget EpisodeWidget(BuildContext context, EpisodeData episode) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: AppColors.formBackground,
      gradient: const LinearGradient(
        colors: [
          AppColors.gradientLeft,
          AppColors.gradientRight,
        ],
      ),
      boxShadow: const [
        BoxShadow(
          blurRadius: 1,
          color: AppColors.formTrailingBorder,
        ),
      ],
    ),
    padding: const EdgeInsets.all(10),
    child: InkWell(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        episode.episode ?? S.of(context).noData,
                        style: AppStyles.s12w400.copyWith(
                          letterSpacing: 1.5,
                          color: AppColors.lightText,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        episode.name ?? S.of(context).noData,
                        style: AppStyles.s16w500.copyWith(
                          height: 1.6,
                          leadingDistribution: TextLeadingDistribution.even,
                          color: AppColors.lightText,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        episode.airDate ?? S.of(context).noData,
                        style: const TextStyle(
                          color: AppColors.lightText,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.chevron_right,
                color: AppColors.buttonBackground,
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => EpisodeDetail(episode: episode),
          ),
        );
      },
    ),
  );
}
