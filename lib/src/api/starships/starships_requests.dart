import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:star_wars/src/api/starships/starships_database.dart';
import '../../models/starships.dart';
import '../base_requests.dart';


class StarshipsRequests extends BaseRequests {
  
  ///Function to get all Starships
  ///Pass [Nothing]
  ///Return [List<Starships>?]
  Future<List<Starships>?> getAllStarships() async {
    bool completed = false;

    try{
      List<Starships> listStarshipsMap = [];

      Response response = await dio.get('starships');
      
      //optei por colocar a verificação aqui pois polparia o tempo de fazer a requisição tudo de novo :)
      if(response.data['count'] != await StarshipsDatabase().count()){

        listStarshipsMap.addAll((response.data['results'] as List).map((e) => Starships.fromMap(e)));

        do{
          if(response.data['next'] != null){
            response = await dio.get(response.data['next']);
            
            listStarshipsMap.addAll((response.data['results'] as List).map((e) => Starships.fromMap(e)));
          }
          else{
            completed = true;
          }

        }while(completed == false);

        return listStarshipsMap;
      }
      else{
        return null;
      }
    }
    catch(err){
      if (kDebugMode) {
        print(err);
      }
      throw Exception(err);
    }
  }

  ///Function to get quantity of starships
  ///Pass [Nothing]
  ///Return [int]
  Future<int> count() async {
    try{
      Response response = await dio.get('starships');

      return response.data['count'];
    }
    catch(err){
      if (kDebugMode) {
        print(err);
      }
      return 0;
    }
  }
}