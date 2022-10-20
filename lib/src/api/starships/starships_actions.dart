




import 'package:flutter/foundation.dart';
import 'package:star_wars/src/api/starships/starships_database.dart';
import 'package:star_wars/src/api/starships/starships_requests.dart';
import 'package:star_wars/src/models/starships.dart';

import '../../utils/network_info.dart';

class StarshipsActions {

  ///Function to update and verify starships in app
  ///Pass [Nothing]
  ///Return [bool?] of success
  Future updateAllStarships() async {
    try{
      if(await hasInternetConnection()){
        var allStarships = await StarshipsRequests().getAllStarships();

        if(allStarships != null){
          bool success = await StarshipsDatabase().insert(allStarships);

          if(!success){
            throw Exception('error insert all starships');
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

  ///Function to get Starships from this URLs from DB
  ///Pass [String]
  ///Return [Starships?]  
  Future<Starships?> getStarshipFromDB(String url) async {
    try{
      var resp = await StarshipsDatabase().getAllFromUrl(url);
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