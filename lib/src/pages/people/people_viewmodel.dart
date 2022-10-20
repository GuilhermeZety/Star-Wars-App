
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../api/films/films_actions.dart';
import '../../api/planets/planets_actions.dart';
import '../../api/starships/starships_actions.dart';
import '../../models/films.dart';
import '../../models/people.dart';
import '../../models/planets.dart';
import '../../models/starships.dart';

part 'people_viewmodel.g.dart';

class PeopleViewModel = _PeopleViewModel with _$PeopleViewModel;

abstract class _PeopleViewModel with Store {
  @observable
  ScrollController scrollController = ScrollController();
  
  
  @observable
  Planets? peoplePlanet;
  @action 
  void setPeoplePlanet(Planets _) => peoplePlanet = _;

  @observable
  Starships? peopleStarship;
  @action 
  void setPeopleStarship(Starships _) => peopleStarship = _;

  @observable
  List<Films> peopleFilms = [];
  @action 
  void setPeopleFilms(List<Films> _) => peopleFilms = _;

  @observable
  bool loading = true;
  @action 
  void setLoading(bool _) => loading = _;


  onLoad(People people) async {
    var planet = await PlanetsActions().getPlanetFromDB(people.homeworld);

    if(planet != null){
      setPeoplePlanet(planet);
    }

    if(people.starships.isNotEmpty){
      var starship = await StarshipsActions().getStarshipFromDB(people.starships.first);

      if(starship != null){
        setPeopleStarship(starship);
      }
    }

    if(people.films.isNotEmpty){
      var films = await FilmsActions().getAllFilmsFromURL(people.films);

      if(films != null){
        setPeopleFilms(films);
      }
    }

    setLoading(false);
  }

}