import 'package:dart_bot/model/user.dart' as myuser;

import 'package:sqlite3/sqlite3.dart';

class DatabaseHelper {
  late Database _db;

  DatabaseHelper(String path) {
    _db = sqlite3.open(path);
    _createTable();
  }

  void _createTable() {
    _db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY,
        countryId TEXT NOT NULL
      )
    ''');
  }

  void insertUser(myuser.User user) {
    _db.execute('''
      INSERT INTO users (id, countryId)
      VALUES (?, ?)
    ''', [user.id, user.countryId]);
  }

  void insertUserIfNotExist(myuser.User user) {
    print(user);
    var existingUser =
        _db.select('SELECT * FROM users WHERE id = ?', [user.id]);
    if (existingUser.isEmpty) {
      insertUser(user);
    } else {
      // Update the existing user's information
      _db.execute('''
      UPDATE users
      SET countryId = ?
      WHERE id = ?
    ''', [user.countryId, user.id]);
    }
  }

  myuser.User? getUserById(int id) {
    var result = _db.select('SELECT * FROM users WHERE id = ?', [id]);
    if (result.isNotEmpty) {
      return myuser.User.fromJson(result.first);
    }
    return null;
  }

  void close() {
    _db.dispose();
  }
}
