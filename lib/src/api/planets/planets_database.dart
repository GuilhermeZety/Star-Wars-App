

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../../db/database.dart';
import '../../models/planets.dart';

class PlanetsDatabase {

  ///
  ///
  ///
  Future<bool> insert(List<Planets> planets) async {
    bool success = false;

    try {
      var database = await DatabaseHandler.instance.initiateDB();

      final batch = database.batch();

      for(Planets planet in planets){
        batch.insert('planets', planet.toMapDB(), conflictAlgorithm: ConflictAlgorithm.replace);
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
  Future<List<Planets>> getAll() async {
    try {
      var database = await DatabaseHandler.instance.initiateDB();
      
      var response = await database.query('planets');
      
      if(response.isNotEmpty){
        return response.map((e) => Planets.fromMapDB(e)).toList();
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
  Future<Planets?> getAllFromUrl(String url) async {
    try {
      var database = await DatabaseHandler.instance.initiateDB();
      
      var response = await database.query('planets',where: 'url == "$url"');
      
      if(response.isNotEmpty){
        return Planets.fromMapDB(response.first);
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

      var response = await database.query('planets', columns: ['count()']);

      return response[0]['count()'];
    }
    catch(err){
      if (kDebugMode) {
        print(err);
      }
    }
  }
}