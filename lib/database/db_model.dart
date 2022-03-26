import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MovieDatabase{
   Database? _database;
  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = 'movie.db';
    final path = join(dbpath, dbname);
    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    return _database!;
  }

    Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        creationDate TEXT,
        isChecked INTEGER
      )
     ''');
  }
    
}