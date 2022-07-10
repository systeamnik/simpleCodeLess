import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/model/persons_data/persons_data.dart';

class RepoPersons {
  Future<ResultRepoPersons> filterByName(String name) async {
    try {
      final url =
          Uri.parse('https://rickandmortyapi.com/api/character/?name=$name');
      final result = await http.get(url);
      final data = jsonDecode(result.body);
      final List personsListJson = data['results'] ?? [];

      final List<PersonsData> personsList = personsListJson
          .map(
            (item) => PersonsData.fromJson(item),
          )
          .toList();
      return ResultRepoPersons(personsList: personsList);
    } catch (error) {
      log('error: $error');
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
