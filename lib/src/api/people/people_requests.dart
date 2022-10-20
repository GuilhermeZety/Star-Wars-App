import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../base_requests.dart';
import 'people_database.dart';
import '../../models/people.dart';
class PeopleRequests extends BaseRequests {
  
  ///Function to get all peoples
  ///Pass [Nothing]
  ///Return [List<People>?]
  Future<List<People>?> getAllPeoples() async {
    bool completed = false;

    try{
      List<People> listPeoplesMap = [];

      Response response = await dio.get('people');
      
      //optei por colocar a verificação aqui pois polparia o tempo de fazer a requisição tudo de novo :)
      if(response.data['count'] != await PeopleDatabase().count()){

        listPeoplesMap.addAll((response.data['results'] as List).map((e) => People.fromMap(e)));

        do{
          if(response.data['next'] != null){
            response = await dio.get(response.data['next']);
            
            listPeoplesMap.addAll((response.data['results'] as List).map((e) => People.fromMap(e)));
          }
          else{
            completed = true;
          }

        }while(completed == false);

        return listPeoplesMap;
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

  ///Function to get quantity of peoples
  ///Pass [Nothing]
  ///Return [int]
  Future<int> count() async {
    try{
      Response response = await dio.get('people');

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