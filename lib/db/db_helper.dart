import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _table = 'task';

  static Future<void> initDB() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'task.db';
      _db = await openDatabase(_path, version: _version,
          onCreate: ((db, version) {
        print('creating');
        return db.execute(
          "CREATE TABLE $_table("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "title STRING, note TEXT, date STRING, "
          "startTime STRING, endTime STRING, "
          "remind INTEGER, repeat STRING, "
          "color INTEGER, "
          "isCompleted INTEGER)",
        );
      }));
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task task) async {
    return await _db?.insert(_table, task.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_table);
  }

  static Future<int> delete(Task task) async {
    return await _db!.delete(_table, where: 'id=?', whereArgs: [task.id]);
  }

  static update(int id) async {
    return await _db!.rawUpdate('''
    UPDATE task
    SET isCompleted = ?
    WHERE id = ?
''', [1, id]);
  }
}
