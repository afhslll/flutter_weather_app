import 'dart:io';
import 'package:flutter_weather_app/core/constant/string_constant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_weather_app/core/model/city.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final Directory dataDirectory = await getApplicationDocumentsDirectory();
    final String dbPath = join(dataDirectory.path, ConstantString.databaseName);
    print(dbPath);
    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${City.table}(
        ${City.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${City.colName} TEXT,
        ${City.colState} TEXT,
        ${City.colLatitude} REAL,
        ${City.colLongitude} REAL
      )
      ''');
  }

  Future<int> insert({@required String table, @required dynamic data}) async {
    final Database db = await database;
    return await db.insert(table, data.toMap());
  }

  Future<int> update(
      {@required String table,
      @required dynamic data,
      @required String where,
      @required List<dynamic> whereArgs}) async {
    final Database db = await database;
    return await db.update(data.table, data.toMap(),
        where: '$where=?', whereArgs: whereArgs);
  }

  Future<int> delete(
      {@required String table,
      @required dynamic data,
      @required String where,
      @required List<dynamic> whereArgs}) async {
    final Database db = await database;
    return await db.delete(data.table, where: '$where=?', whereArgs: whereArgs);
  }

  Future<List<Map<String, dynamic>>> fetch({String table}) async {
    final Database db = await database;
    return await db.query(table);
  }
}
