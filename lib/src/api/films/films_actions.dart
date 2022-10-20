



import 'package:flutter/foundation.dart';

import '../../models/films.dart';
import 'films_database.dart';
import 'films_requests.dart';

import '../../utils/network_info.dart';

class FilmsActions {

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