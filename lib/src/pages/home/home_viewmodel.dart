import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../api/people/people_database.dart';
import '../../models/people.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  Timer? searching;

  @observable
  ScrollController scrollController = ScrollController();

  @observable
  TextEditingController searchController = TextEditingController();
  @action 
  void setSearchControllerText(String _) => searchController.text = _;

  @observable
  List<People> listAllPersons = [];
  @action 
  void setListAllPersons(List<People> _) => listAllPersons = _;

  @observable
  List<People> listPersons = [];
  @action 
  void setListPersons(List<People> _) => listPersons = _;

  
  onload() async {
    setListAllPersons(await PeopleDatabase().getAll());
    setListPersons(listAllPersons);
  }

  onSearch(String name){
    if(searching != null){
      searching!.cancel();
    }

    Timer(const Duration(milliseconds: 50), () {
      changePeoples(name);
    });
  }
  
  changePeoples(String name) async {
    if(name.isEmpty){
      setListPersons(listAllPersons);
    }
    else{
      setListPersons(listAllPersons.where((element) => element.name.toUpperCase().contains(name.toUpperCase())).toList());      
    }
  }

  dispose(){
    searchController.dispose();   
    if(searching != null){
      searching!.cancel();
    }
  }
}