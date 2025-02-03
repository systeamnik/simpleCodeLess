import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursik/bloc/persons/bloc_persons.dart';
import 'package:nursik/bloc/persons/events_bloc.dart';
import 'package:nursik/bloc/persons/states_bloc.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/constants/app_styles.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/ui/app_widgets/app_nav_bar_widger.dart';
import 'package:nursik/ui/persons_screen/widgets/gridview_widget.dart';
import 'package:nursik/ui/persons_screen/widgets/listview_widget.dart';
import 'package:nursik/ui/persons_screen/widgets/search_bar_widget.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  static final isListView = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: AppColors.screenBackgroundLight,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            bottomNavigationBar: const AppNavBarWidget(currentPage: 0),
            body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBarWidget(
                      placeholder: S.of(context).findPerson,
                      onChange: (String value) {
                        BlocProvider.of<BlocPersons>(context)
                            .add(EventPersonsFilterByName(value, 1000));
                      },
                    ),
                    BlocBuilder<BlocPersons, StateBlocPersons>(
                      builder: (context, state) {
                        var personsTotal = 0;
                        if (state is StatePersonsData) {
                          personsTotal = state.data.length;
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  S.of(context).personCount.toUpperCase() +
                                      ": " +
                                      personsTotal.toString(),
                                  style: AppStyles.s10w500.copyWith(
                                    letterSpacing: 1.5,
                                    color: AppColors.icon,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  isListView.value = !isListView.value;
                                },
                                icon: ValueListenableBuilder<bool>(
                                  valueListenable: isListView,
                                  builder: (context, isListViewMode, _) {
                                    return isListViewMode
                                        ? SvgPicture.asset(
                                            AppAssets.svg.iconList,
                                          )
                                        : SvgPicture.asset(
                                            AppAssets.svg.iconGrid,
                                          );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: BlocBuilder<BlocPersons, StateBlocPersons>(
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
                                    height: MediaQuery.of(context).size.height *
                                        0.60,
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
                                  return ValueListenableBuilder<bool>(
                                    valueListenable: isListView,
                                    builder: (context, isListViewMode, _) {
                                      return isListViewMode
                                          ? ListViewWidget(personsList: data)
                                          : GridViewWidget(personsList: data);
                                    },
                                  );
                                }
                              },
                              error: (error) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(error + ' dwdw'),
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
      ),
    );
  }
}
