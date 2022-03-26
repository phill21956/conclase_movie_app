import 'package:conclase_movie_app/database/db_movie_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/movie_model.dart';

class MovieDatabase {
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
      CREATE TABLE movie(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        image TEXT,
        ratings TEXT,
        isChecked INTEGER
      )
     ''');
  }

  Future<void> insertMovie(Movie movie) async {
    final db = await database;
    await db.insert(
      'movie',
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteMovie(Movie movie) async {
    final db = await database;
    await db.delete(
      'movie',
      where: 'id == ?',
      whereArgs: [movie.id],
    );
  }

  Future<List<Movie>> getMovie() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query(
      'movie',
      orderBy: 'id DESC',
    );

    return List.generate(
      items.length,
      (i) => Movie(
          id: items[i]['id'],
          title: items[i]['title'],
          image: items[i]['image'],
          ratings: items[i]['ratings'],
          isChecked: items[i]['isChecked'] == 1 ? true : false),
    );
  }
}
