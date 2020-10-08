import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'cities.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_cities(id INTEGER PRIMARY KEY, name TEXT, state TEXT, latitude REAL, longitude REAL, is_gps INTEGER)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    print('INSERT DB user_cities');
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    print('READ DB user_cities');
    return db.query(table);
  }
}
