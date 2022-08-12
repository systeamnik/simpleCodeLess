import 'package:nursik/generated/l10n.dart';
import 'package:nursik/model/persons_data/location.dart';
import 'package:nursik/repo/api.dart';

class RepoLocations {
  final Api api;

  RepoLocations({required this.api});
  Future<ResultRepoLocations> filterByName(String name) async {
    try {
      final result = await api.dio.get(
        '/location/',
        queryParameters: {
          'name': name,
        },
      );
      final List personsListJson = result.data['results'] ?? [];
      final personsList = personsListJson
          .map(
            (e) => Location.fromJson(e),
          )
          .toList();
      return ResultRepoLocations(locationsList: personsList);
    } catch (error) {
      // log('error: $error');
      return ResultRepoLocations(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }
}

class ResultRepoLocations {
  final String? errorMessage;
  final List<Location>? locationsList;

  ResultRepoLocations({
    this.errorMessage,
    this.locationsList,
  });
}
