import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../models/planets.dart';
import '../base_requests.dart';
import 'planets_database.dart';


class PlanetsRequests extends BaseRequests {
  
  ///Function to get all planets
  ///Pass [Nothing]
  ///Return [List<Planets>?]
  Future<List<Planets>?> getAllFilms() async {
    bool completed = false;

    try{
      List<Planets> listPlanetsMap = [];

      Response response = await dio.get('planets');
      
      //optei por colocar a verificação aqui pois polparia o tempo de fazer a requisição tudo de novo :)
      if(response.data['count'] != await PlanetsDatabase().count()){

        listPlanetsMap.addAll((response.data['results'] as List).map((e) => Planets.fromMap(e)));

        do{
          if(response.data['next'] != null){
            response = await dio.get(response.data['next']);
            
            listPlanetsMap.addAll((response.data['results'] as List).map((e) => Planets.fromMap(e)));
          }
          else{
            completed = true;
          }

        }while(completed == false);

        return listPlanetsMap;
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

  ///Function to get quantity of planets
  ///Pass [Nothing]
  ///Return [int]
  Future<int> count() async {
    try{
      Response response = await dio.get('planets');

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