import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/model/persons_data/persons_data.dart';

class RepoPersons {
  Future<ResultRepoPersons> readPersons() async {
    try {
      final url = Uri.parse('https://rickandmortyapi.com/api/character');
      final result = await http.get(url);
      final data = jsonDecode(result.body);
      final personsListJson = data['results'] as List;
      final personsList = personsListJson
          .map(
            (item) => PersonsData.fromJson(item),
          )
          .toList();
      return ResultRepoPersons(personsList: personsList);
    } catch (error) {
      return ResultRepoPersons(errorMessage: S.current.somethingWentWrong);
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
