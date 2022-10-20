





import 'package:flutter/foundation.dart';
import 'package:star_wars/src/models/planets.dart';

import 'planets_requests.dart';

import '../../utils/network_info.dart';
import 'planets_database.dart';

class PlanetsActions {

  ///Function to update and verify planets in app
  ///Pass [Nothing]
  ///Return [bool?] of success
  Future updateAllPlanets() async {
    try{
      if(await hasInternetConnection()){
        var allPlanets = await PlanetsRequests().getAllFilms();

        if(allPlanets != null){
          bool success = await PlanetsDatabase().insert(allPlanets);

          if(!success){
            throw Exception('error insert all planets');
          }
        }
      }
    }
    catch(err){
      if (kDebugMode) {
        print(err);
      }
    }
  }

  ///Function to get planet from this URLs from DB
  ///Pass [String]
  ///Return [Planets?]
  Future<Planets?> getPlanetFromDB(String url) async {
    try{
      var resp = await PlanetsDatabase().getAllFromUrl(url);
      return resp;
    }
    catch(err){
      if (kDebugMode) {
        print(err);
      }
    }
    return null;
  }
}