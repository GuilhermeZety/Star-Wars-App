// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'query_create.dart';

class DatabaseHandler {
  DatabaseHandler._();

  static DatabaseHandler? _instance;

  static DatabaseHandler get instance {
    return _instance ??= DatabaseHandler._();
  }

  int dbVersion = 1;

  Future<Database> initiateDB() async {
    const dbPath = 'star_wars.db';

   

    if(await databaseExists(dbPath)){
      Database db = await openDatabase(join(await getDatabasesPath(), dbPath),
        onOpen: (db) async {
          await db.execute(sqlPeoples);
          await db.execute(sqlFilms);
          await db.execute(sqlPlanets);
          await db.execute(sqlStarships);
        },
      );

      if(await db.getVersion() < dbVersion){
        await deleteDatabase(db.path);
        return await initiateDB();
      }else{
        return db;
      }
    }

    return await openDatabase(join(await getDatabasesPath(), dbPath), //futurmente migrar pro cod empresa
      version: dbVersion,
      onCreate: (db, version) async {
        await db.execute(sqlPeoples);        
        await db.execute(sqlFilms);        
        await db.execute(sqlPlanets);        
        await db.execute(sqlStarships);        
      },
    ).catchError((e) async {
      if (kDebugMode) {
        print('Database error: $e');
      }
    });
  }
}