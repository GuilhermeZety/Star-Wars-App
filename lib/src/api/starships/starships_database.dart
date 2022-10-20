import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:star_wars/src/models/starships.dart';

import '../../db/database.dart';

class StarshipsDatabase {

  ///
  ///
  ///
  Future<bool> insert(List<Starships> starships) async {
    bool success = false;

    try {
      var database = await DatabaseHandler.instance.initiateDB();

      final batch = database.batch();

      for(Starships starship in starships){
        batch.insert('starships', starship.toMapDB(), conflictAlgorithm: ConflictAlgorithm.replace);
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
  Future<List<Starships>> getAll() async {
    try {
      var database = await DatabaseHandler.instance.initiateDB();
      var response = await database.query('starships');
      
      if(response.isNotEmpty){
        return response.map((e) => Starships.fromMapDB(e)).toList();
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
  Future<Starships?> getAllFromUrl(String url) async {
    try {
      var database = await DatabaseHandler.instance.initiateDB();
      
      var response = await database.query('starships',where: 'url == "$url"');
      
      if(response.isNotEmpty){
        return Starships.fromMapDB(response.first);
      }
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

      var response = await database.query('starships', columns: ['count()']);

      return response[0]['count()'];
    }
    catch(err){
      if (kDebugMode) {
        print(err);
      }
    }
  }
}