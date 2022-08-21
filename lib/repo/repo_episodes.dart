import 'package:nursik/generated/l10n.dart';
import 'package:nursik/model/persons_data/episode_data.dart';
import 'package:nursik/repo/api.dart';

class RepoEpisodes {
  RepoEpisodes({required this.api});

  final Api api;

  Future<ResultRepoEpisodes> fetch() => nextPage(1);

  Future<ResultRepoEpisodes> nextPage(int page) async {
    try {
      final result = await api.dio.get('/episode?page=$page');

      //page is not
      final bool isEndOfData = result.data['info']['next'] == null;

      //
      final List json = result.data['results'] ?? [];
      final list = json.map((item) => EpisodeData.fromJson(item));

      return ResultRepoEpisodes(
        episodes: list.toList(),
        isEndOfData: isEndOfData,
      );
    } catch (error) {
      // print("Error: $error");
      return ResultRepoEpisodes(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }
}

class ResultRepoEpisodes {
  final List<EpisodeData>? episodes;
  final bool isEndOfData;
  final String? errorMessage;

  ResultRepoEpisodes({
    this.episodes,
    this.isEndOfData = false,
    this.errorMessage,
  });
}
