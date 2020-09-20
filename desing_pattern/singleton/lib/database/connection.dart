import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Connection {
  static const VERSION = 1;
  static const DATABASE_NAME = 'singleton_teste';

  Database _db;
  static Connection _instance;

  Connection._();

  static Connection get instance {
    _instance ??= Connection._();
    return _instance;
  }

  Future<Database> get db => _openDatabaseConnection();

  Future<Database> _openDatabaseConnection() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, DATABASE_NAME);
    if (_db == null) {
      _db = await openDatabase(
        path,
        version: VERSION,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      );
    }
    return _db;
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.execute("create table teste(nome varchar(200))");
    db.execute("insert into teste values('Kaio Ribeiro')");
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {}

  Future<void> closeConnection() async {
    await _db.close();
    _db = null;
  }
}
