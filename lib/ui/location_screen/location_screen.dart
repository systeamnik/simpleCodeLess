import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursik/bloc/locations/bloc_location.dart';
import 'package:nursik/bloc/locations/events_bloc.dart';
import 'package:nursik/bloc/locations/states_bloc.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/ui/app_widgets/app_nav_bar_widger.dart';
import 'package:nursik/ui/location_screen/widgets/locations_listview_widget.dart';
import 'package:nursik/ui/persons_screen/widgets/search_bar_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.screenBackgroundLight,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          bottomNavigationBar: const AppNavBarWidget(currentPage: 1),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  SearchBarWidget(
                    placeholder: S.of(context).findLocation,
                    onChange: (String value) {
                      BlocProvider.of<BlocLocations>(context)
                          .add(EventLocationsFilterByName(value, 1000));
                    },
                  ),
                  BlocBuilder<BlocLocations, StateBlocLocations>(
                    builder: (context, state) {
                      var locationTotal = 0;
                      if (state is StateLocationData) {
                        locationTotal = state.data.length;
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                S.of(context).locationCount.toUpperCase() +
                                    ": " +
                                    locationTotal.toString(),
                                style: AppStyles.s10w500.copyWith(
                                  letterSpacing: 1.5,
                                  color: AppColors.icon,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: BlocBuilder<BlocLocations, StateBlocLocations>(
                      builder: ((context, state) {
                        return state.when(
                            initial: () => const SizedBox.shrink(),
                            loading: () {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  CircularProgressIndicator(),
                                ],
                              );
                            },
                            data: (data) {
                              if (data.isEmpty) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.60,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          color: Colors.blue,
                                        ),
                                        Image.asset(
                                          AppAssets.images.personsNotFound,
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          S.of(context).personsListIsEmpty,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return LocationListViewWidget(
                                  locationsList: data,
                                );
                              }
                            },
                            error: (error) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(error),
                                  )
                                ],
                              );
                            });
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
