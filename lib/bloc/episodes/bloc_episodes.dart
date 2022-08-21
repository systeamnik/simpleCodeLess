import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursik/bloc/episodes/events_bloc.dart';
import 'package:nursik/bloc/episodes/states_bloc.dart';
import 'package:nursik/model/persons_data/episode_data.dart';
import 'package:nursik/repo/repo_episodes.dart';

part 'part/fetch.dart';
part 'part/next_page.dart';

class BlocEpisodes extends Bloc<EventsBlocEpisodes, StateBlocEpisodes> {
  BlocEpisodes({
    required this.repo,
  }) : super(const StateBlocEpisodes.initial()) {
    on<EventEpisodesFetch>(_fetch);
    on<EventEpisodesNextPage>(_nextPage);
  }

  final RepoEpisodes repo;

  int _currentPage = 1;

  //индикатор окончания данных, чтобы не запрашивать
  //следующую страницу если текущая является последней
  bool _isEndOfData = false;

  //индикатор того, что запрос в процессе исполнения
  //нужен чтобы избежать параллельных запросов
  bool _isInProgress = false;
}
