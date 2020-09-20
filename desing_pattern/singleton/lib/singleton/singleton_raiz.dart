import 'dart:math';

class SingletonRaiz {
  //exemplificando a implementação de singleton tracional com construtor privado

  static SingletonRaiz _instance;
  int id = Random().nextInt(50);

  SingletonRaiz._internal();

  static get instance {
    //estratégia de condicional
    _instance ??= SingletonRaiz._internal();

    return _instance;
  }
}
