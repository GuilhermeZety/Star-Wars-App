

import 'package:flutter/foundation.dart';

import 'people_database.dart';
import 'people_requests.dart';
import '../../utils/network_info.dart';


class PeopleActions {

  ///Function to update and verify peoples in app
  ///Pass [Nothing]
  ///Return [bool?] of success
  Future updateAllPeoples() async {
    try{
      if(await hasInternetConnection()){
        var allPeoples = await PeopleRequests().getAllPeoples();

        if(allPeoples != null){
          bool success = await PeopleDatabase().insert(allPeoples);

          if(!success){
            throw Exception('error insert all peoples');
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
}