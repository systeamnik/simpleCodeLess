import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursik/bloc/episodes/bloc_episodes.dart';
import 'package:nursik/bloc/episodes/states_bloc.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/ui/app_widgets/app_nav_bar_widger.dart';
import 'package:nursik/ui/episodes_screen/widgets/body_widget.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.screenBackgroundLight,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          bottomNavigationBar: const AppNavBarWidget(currentPage: 2),
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              S.of(context).episodes,
              style: const TextStyle(
                color: AppColors.appBarTitle,
              ),
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(
                      child: BlocBuilder<BlocEpisodes, StateBlocEpisodes>(
                        buildWhen: (prev, next) {
                          if (prev.runtimeType != next.runtimeType) {
                            return true;
                          } else {
                            final prevDataLength = prev.mapOrNull(
                              data: (state) => state.data.length,
                            );
                            final nextDataLength = next.mapOrNull(
                              data: (state) => state.data.length,
                            );
                            return prevDataLength != nextDataLength;
                          }
                        },
                        builder: (context, state) {
                          return state.map(
                            initial: (_) => const SizedBox.shrink(),
                            loading: (_) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            data: (state) => BodyWidget(data: state.data),
                            error: (state) => ErrorWidget(state.error),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<BlocEpisodes, StateBlocEpisodes>(
                builder: (context, state) {
                  final isLoading = state.maybeMap(
                    data: (state) => state.isLoading,
                    orElse: () => false,
                  );

                  return Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: isLoading
                        ? const LinearProgressIndicator()
                        : const SizedBox.shrink(),
                  );
                },
                listener: (context, state) {
                  state.mapOrNull(
                    data: (state) {
                      if (state.errorMessage != null) {
                        showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(30.0),
                              title: Text(
                                S.of(context).error,
                                style: AppStyles.s20w500,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    state.errorMessage!,
                                    style: AppStyles.s14w400,
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    height: 48,
                                    child: OutlinedButton(
                                      style: AppStyles.buttomStyleRounded,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                S.of(context).ok,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        );
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
