import 'package:nursik/generated/l10n.dart';
import 'package:nursik/model/persons_data/persons_data.dart';
import 'package:nursik/repo/api.dart';

class RepoPersons {
  final Api api;

  RepoPersons({required this.api});
  Future<ResultRepoPersons> filterByName(String name) async {
    try {
      final result = await api.dio.get(
        '/character/',
        queryParameters: {
          'name': name,
        },
      );
      final List personsListJson = result.data['results'] ?? [];
      final personsList = personsListJson
          .map(
            (e) => PersonsData.fromJson(e),
          )
          .toList();
      return ResultRepoPersons(personsList: personsList);
    } catch (error) {
      // log('error: $error');
      return ResultRepoPersons(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }
}

class ResultRepoPersons {
  final String? errorMessage;
  final List<PersonsData>? personsList;

  ResultRepoPersons({
    this.errorMessage,
    this.personsList,
  });
}
