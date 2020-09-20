import 'dart:math';

class SingletonFactory {
  static SingletonFactory _instance;
  int id = Random().nextInt(50);

  SingletonFactory._();

  factory SingletonFactory() {
    _instance ??= SingletonFactory._();
    return _instance;
  }
}
