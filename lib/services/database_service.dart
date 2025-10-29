import 'package:ihwp/models/prakruti_result_model.dart';
import 'package:ihwp/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';


class DatabaseService {
  static Database? _database;
  static final DatabaseService _instance = DatabaseService._internal();

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "prakruti_app.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    // User table
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
      )
    ''');

    // Prakruti results table
    await db.execute('''
      CREATE TABLE prakruti_results(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        vataScore INTEGER NOT NULL,
        pittaScore INTEGER NOT NULL,
        kaphaScore INTEGER NOT NULL,
        dominantPrakruti TEXT NOT NULL,
        FOREIGN KEY (userId) REFERENCES users (id)
      )
    ''');

    // Exercise log table
    await db.execute('''
      CREATE TABLE exercise_logs(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        exerciseId TEXT NOT NULL,
        date TEXT NOT NULL,
        completed INTEGER NOT NULL DEFAULT 0,
        UNIQUE(userId, exerciseId, date)
      )
    ''');
  }

  // --- User CRUD ---

  Future<User?> createUser(String username, String email, String password) async {
    try {
      final db = await database;
      int id = await db.insert('users', {
        'username': username,
        'email': email,
        'password': password, // Note: In a real app, HASH the password!
      });
      return User(id: id, username: username, email: email);
    } catch (e) {
      print("Error creating user: $e");
      return null;
    }
  }

  Future<User?> getUserByUsername(String username, String password) async {
    final db = await database;
    var res = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return res.isNotEmpty
        ? User.fromMap(res.first)
        : null;
  }

  Future<User?> getUserById(int id) async {
    final db = await database;
    var res = await db.query('users', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? User.fromMap(res.first) : null;
  }

  // --- Prakruti CRUD ---

  Future<void> savePrakrutiResult(PrakrutiResult result) async {
    final db = await database;
    await db.insert(
      'prakruti_results',
      result.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<PrakrutiResult?> getPrakrutiResult(int userId) async {
    final db = await database;
    var res = await db.query(
      'prakruti_results',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return res.isNotEmpty ? PrakrutiResult.fromMap(res.first) : null;
  }

  // --- Exercise Log CRUD ---

  Future<void> logExercise(int userId, String exerciseId, String date, bool completed) async {
    final db = await database;
    await db.insert(
      'exercise_logs',
      {
        'userId': userId,
        'exerciseId': exerciseId,
        'date': date,
        'completed': completed ? 1 : 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<String>> getCompletedExercises(int userId, String date) async {
    final db = await database;
    var res = await db.query(
      'exercise_logs',
      where: 'userId = ? AND date = ? AND completed = 1',
      whereArgs: [userId, date],
    );
    return res.map((log) => log['exerciseId'] as String).toList();
  }
}
