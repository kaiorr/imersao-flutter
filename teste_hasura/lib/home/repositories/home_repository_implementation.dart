import 'package:flutter/semantics.dart';
import 'package:teste_hasura/shared/constants.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final _client = HasuraConnect(HASURA_URL);

  @override
  Future<List<Map>> getTarefas() async {
   final response =  await _client.query(
      '''
        query {
          posts {
            id
            name
            photo
          }
        }

      ''');
      return
   }

  @override
  Stream<List<Map>> streamTarefas() {
    return tarefas
      .snapshots()
      .map((e) => e.documents.map(e) => {"name": e.data['name']}).toList());
  }

}
