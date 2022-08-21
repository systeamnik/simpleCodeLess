import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nursik/model/persons_data/episode_data.dart';
part 'states_bloc.freezed.dart';

@freezed
class StateBlocEpisodes with _$StateBlocEpisodes {
  const factory StateBlocEpisodes.data({
    required List<EpisodeData> data,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = StateBlocEpisodesData;

  const factory StateBlocEpisodes.error(String error) = StateEpisodesError;
  const factory StateBlocEpisodes.initial() = StateEpisodesInitial;
  const factory StateBlocEpisodes.loading() = StateEpisodesLoading;
}
