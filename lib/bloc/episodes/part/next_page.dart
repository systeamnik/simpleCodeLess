part of '../bloc_episodes.dart';

extension NextPage on BlocEpisodes {
  Future<void> _nextPage(
    EventEpisodesNextPage event,
    Emitter<StateBlocEpisodes> emit,
  ) async {
    //индикатор окончания данных, чтобы не запрашивать
    //следующую страницу если текущая является последней
    // bool _isEndOfData = false;

    //индикатор того, что запрос в процессе исполнения
    //нужен чтобы избежать параллельных запросов
    // bool _isInProgress = false;

    if (_isEndOfData) return;
    if (_isInProgress) return;
    _isInProgress = true;
    final currentData = state.maybeMap(
      data: (value) => value.data,
      orElse: () => <EpisodeData>[],
    );
    emit(
      StateBlocEpisodes.data(
        data: currentData,
        isLoading: true,
      ),
    );
    final result = await repo.nextPage(_currentPage + 1);
    if (result.errorMessage != null) {
      emit(
        StateBlocEpisodes.data(
          data: currentData,
          errorMessage: result.errorMessage,
        ),
      );
      return;
    }
    emit(
      StateBlocEpisodes.data(
        data: [...currentData, ...result.episodes!],
      ),
    );
    _currentPage++;
    _isEndOfData = result.isEndOfData;
    _isInProgress = false;
  }
}
