import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../../db/database.dart';
import '../../models/films.dart';

class FilmsDatabase {

  ///
  ///
  ///
  Future<bool> insert(List<Films> films) async {
    bool success = false;

    try {
      var database = await DatabaseHandler.instance.initiateDB();

      final batch = database.batch();

      for(Films film in films){
        batch.insert('films', film.toMapDB(), conflictAlgorithm: ConflictAlgorithm.replace);
      }

      await batch.commit(noResult: true);

      success = true;
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return success;
  }

  ///
  ///
  ///
  Future<List<Films>> getAll() async {
    try {
      var database = await DatabaseHandler.instance.initiateDB();
      var response = await database.query('films');
      
      if(response.isNotEmpty){
        return response.map((e) => Films.fromMapDB(e)).toList();
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return [];
  }

  ///
  ///
  ///
  Future<List<Films>?> getAllFromUrl(List urls) async {
    try {
      var database = await DatabaseHandler.instance.initiateDB();

      List<Films> films = [];

      for(var url in urls){
        var response = await database.query('films',where: 'url == "$url"');
        if(response.isNotEmpty){
          films.add(Films.fromMapDB(response.first));
        }
      }
      
      return films;
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }

    return null;
  }


  count() async {
    try{
      var database = await DatabaseHandler.instance.initiateDB();

      var response = await database.query('films', columns: ['count()']);

      return response[0]['count()'];
    }
    catch(err){
      if (kDebugMode) {
        print(err);
      }
    }
  }
}