import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
  final path = join(await getDatabasesPath(), 'vital.db');
  // await deleteDatabase(path);
  return await openDatabase(
    path,
    version: 6,
onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT NOT NULL UNIQUE,
          password TEXT NOT NULL,
          weight REAL,
          height REAL,
          profile_image_path TEXT,
          training_preference TEXT
        )
      ''');
      await db.execute('''
        CREATE TABLE annotations(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          text TEXT NOT NULL,
          createdAt TEXT NOT NULL,
          completed INTEGER DEFAULT 0
        )
      ''');
    },
    onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE users ADD COLUMN weight REAL');
          await db.execute('ALTER TABLE users ADD COLUMN height REAL');
        }
        if (oldVersion < 3) {
          await db.execute('ALTER TABLE users ADD COLUMN profile_image_path TEXT');
        }
        if (oldVersion < 5) {
          try {
            await db.execute('ALTER TABLE annotations ADD COLUMN completed INTEGER DEFAULT 0');
          } catch (e) {
            print('Erro ao adicionar coluna completed: $e');
          }
        }
        if (oldVersion < 6) {
          try {
            await db.execute('ALTER TABLE users ADD COLUMN training_preference TEXT');
          } catch (e) {
            print('Erro ao adicionar coluna training_preference: $e');
          }
        }
      },
    );
  }

  // Adicione este método ao seu DatabaseService
Future<void> checkDatabaseStructure() async {
  final db = await database;
  
  // Verifica as tabelas
  var tables = await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
  print('Tabelas no banco de dados: ${tables.map((t) => t['name']).join(', ')}');
  
  // Verifica as colunas da tabela users
  var userColumns = await db.rawQuery("PRAGMA table_info(users)");
  print('Colunas na tabela users: ${userColumns.map((c) => c['name']).join(', ')}');
}

  // Método atualizado para aceitar peso e altura
  Future<int> insertUser(String name, String email, String password, {double? weight, double? height, String? profileImagePath}) async {
    final db = await database;
    return await db.insert('users', {
      'name': name,
      'email': email,
      'password': password,
      'weight': weight,
      'height': height,
      'profile_image_path': profileImagePath,
    });
  }

  Future<void> updateUserPreference(String userId, String trainingType) async {
    final db = await database;
    await db.update(
      'users',
      {'training_preference': trainingType},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

Future<void> updateUser(
  String email,
  {String? name, double? weight, double? height, String? profileImagePath, String? trainingPreference}
) async {
    final db = await database;

    final values = <String, dynamic>{};
    if (name != null) values['name'] = name;
    if (weight != null) values['weight'] = weight;
    if (height != null) values['height'] = height;
    if (profileImagePath != null) values['profile_image_path'] = profileImagePath;
    if (trainingPreference != null) values['training_preference'] = trainingPreference;

    if (values.isNotEmpty) {
      await db.update(
        'users',
        values,
        where: 'email = ?',
        whereArgs: [email],
      );
    }
  }
  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final db = await database;

    final List<Map<String, dynamic>> results = await db.query(
      'users',
      columns: ['id', 'name', 'email', 'weight', 'height', 'profile_image_path', 'training_preference'],
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return results.first;
    }

    return null;
  }
}