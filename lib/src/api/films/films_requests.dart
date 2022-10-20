import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../models/films.dart';
import '../base_requests.dart';
import 'films_database.dart';


class FilmsRequests extends BaseRequests {
  
  ///Function to get all films
  ///Pass [Nothing]
  ///Return [List<Films>?]
  Future<List<Films>?> getAllFilms() async {
    bool completed = false;

    try{
      List<Films> listFilmsMap = [];

      Response response = await dio.get('films');
      
      //optei por colocar a verificação aqui pois polparia o tempo de fazer a requisição tudo de novo :)
      if(response.data['count'] != await FilmsDatabase().count()){

        listFilmsMap.addAll((response.data['results'] as List).map((e) => Films.fromMap(e)));

        do{
          if(response.data['next'] != null){
            response = await dio.get(response.data['next']);
            
            listFilmsMap.addAll((response.data['results'] as List).map((e) => Films.fromMap(e)));
          }
          else{
            completed = true;
          }

        }while(completed == false);

        return listFilmsMap;
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

  ///Function to get quantity of films
  ///Pass [Nothing]
  ///Return [int]
  Future<int> count() async {
    try{
      Response response = await dio.get('films');

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