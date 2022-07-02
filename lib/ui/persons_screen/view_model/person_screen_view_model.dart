import 'package:flutter/material.dart';
import 'package:nursik/constants/app_colors.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/model/persons_data/persons_data.dart';
import 'package:nursik/service/repo_persons.dart';

class PersonScreenViewModel extends ChangeNotifier {
  PersonScreenViewModel({required this.repo}) {
    _init();
  }

  PageController pageController = PageController();
  String? errorMessage;
  List<PersonsData> filteredList = <PersonsData>[];
  var isLoading = true;
  bool isListView = true;
  int selectedIndex = 0;
  final RepoPersons repo;

  var _personsList = <PersonsData>[];

  void _init() {
    repo.readPersons().then((result) {
      errorMessage = result.errorMessage;
      _personsList = result.personsList ?? <PersonsData>[];
      filteredList = _personsList;
      isLoading = false;
      notifyListeners();
    });
  }

  void switchView() {
    isListView = !isListView;
    notifyListeners();
  }

  void onTapped(int index) {
    selectedIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  void filter(String value) {
    filteredList = _personsList.where((element) {
      if (element.name == null) return false;
      final name = element.name!.toLowerCase();
      return name.contains(value);
    }).toList();
    notifyListeners();
  }

  String personSpecies(String? species) {
    if (species == 'Human') return S.current.human;
    if (species == 'Alien') return S.current.alien;
    return S.current.unknown;
  }

  String personGender(String? gender) {
    if (gender == 'Male') return S.current.man;
    if (gender == 'Female') return S.current.woman;
    return S.current.unknown;
  }

  Color statusColor(String? status) {
    if (status == 'Dead') return AppColors.avatarStatusDead;
    if (status == 'Alive') return AppColors.avatarStatusLive;
    return Colors.grey;
  }

  String statusLabel(String? status) {
    if (status == 'Dead') return S.current.dead;
    if (status == 'Alive') return S.current.live;
    return S.current.noData;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
