import 'package:dio/dio.dart';

class BaseRequests {
 Dio dio = Dio(
  BaseOptions(
    baseUrl:'https://swapi.dev/api/' 
  )
 );
}