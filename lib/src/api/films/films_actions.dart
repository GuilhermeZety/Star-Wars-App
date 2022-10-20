



import 'package:flutter/foundation.dart';

import '../../models/films.dart';
import 'films_database.dart';
import 'films_requests.dart';

import '../../utils/network_info.dart';

class FilmsActions {

  ///Function to update and verify films in app
  ///Pass [Nothing]
  ///Return [bool?] of success
  Future updateAllFilms() async {
    try{
      if(await hasInternetConnection()){
        var allFilms = await FilmsRequests().getAllFilms();

        if(allFilms != null){
          bool success = await FilmsDatabase().insert(allFilms);

          if(!success){
            throw Exception('error insert all films');
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

  ///Function to get All films from this URLs
  ///Pass [List<String>]
  ///Return [List<Films>?]
  Future<List<Films>?> getAllFilmsFromURL(List films) async {    
    try{
      var resp = await FilmsDatabase().getAllFromUrl(films);
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