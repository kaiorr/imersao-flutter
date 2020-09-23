import 'package:mobx/mobx.dart';
import 'package:prototype/cliente.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @Observable
  Cliente cliente;

  @action
  void loadCliente() {
    cliente = cliente(nome: 'Rodrigo', telefone: '62 99999-9999', idade: 30);
  }
}
