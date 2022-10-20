import 'dart:async';

import 'package:flutter/material.dart';
import 'package:star_wars/src/api/films/films_actions.dart';
import 'package:star_wars/src/api/planets/planets_actions.dart';
import 'package:star_wars/src/models/planets.dart';
import 'package:star_wars/src/models/starships.dart';

import '../../api/starships/starships_actions.dart';
import '../../components/divider.dart';
import '../../components/top_menu_bar.dart';
import '../../models/films.dart';
import '../../models/people.dart';
import '../../utils/behavior.dart';
import '../../utils/internationalization.dart';
import '../../utils/navigate.dart';
import '../../utils/util.dart';
import '../home/home_page.dart';
import 'widgets/film_select_widget.dart';
import 'widgets/info_widget.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key, required this.people});

  final People people;

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  ScrollController scrollController = ScrollController();

  Planets? peoplePlanet;
  Starships? peopleStarship;
  List<Films> peopleFilms = [];
  bool loading = true;

  @override
  void initState() {
    Timer.run(() async => await onLoad());
    super.initState();
  }

  onLoad() async {
    var planet = await PlanetsActions().getPlanetFromDB(widget.people.homeworld);

    if(planet != null){
      peoplePlanet = planet;
    }

    if(widget.people.starships.isNotEmpty){
      var starship = await StarshipsActions().getStarshipFromDB(widget.people.starships.first);

      if(starship != null){
        peopleStarship = starship;
      }
    }

    if(widget.people.films.isNotEmpty){
      var films = await FilmsActions().getAllFilmsFromURL(widget.people.films);

      if(films != null){
        peopleFilms.addAll(films);
      }
    }

    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopMenuBar(height: 100, name: LocaleTexts.of(context).getText('character')),
      body: WillPopScope(
        onWillPop: () async {
          to(context, const HomePage());
          return true;
        },
        child: SafeArea(
          child: ScrollConfiguration(
            behavior: MyBehavior(), 
            child: 
              loading ? 
              const Center(
                child: CircularProgressIndicator(),
              )
              :
            SingleChildScrollView(
              child: 
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.44,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(                          
                            color: Theme.of(context).colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset('assets/images/no-image-people.png')
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.44,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(widget.people.name, style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor), textAlign: TextAlign.center,),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: InfoWidget(
                                      title: '${LocaleTexts.of(context).getText('genre')}:',
                                      content: genderTradutor(context, widget.people.gender),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: InfoWidget(
                                      title: '${LocaleTexts.of(context).getText('birth')}:',
                                      content: widget.people.birth_year,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),                    
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: DividerWithWidget(
                        child: Text(LocaleTexts.of(context).getText('homeworld'), style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 220,
                          width: MediaQuery.of(context).size.width * 0.44,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  InfoWidget(
                                    title: '${LocaleTexts.of(context).getText('planet_name')}:',
                                    content: peoplePlanet != null ? peoplePlanet!.name : '',
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: InfoWidget(
                                      title: '${LocaleTexts.of(context).getText('diameter')}:',
                                      content: peoplePlanet != null ? '${peoplePlanet!.diameter} km' : '',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.44,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: InfoWidget(
                                        title: '${LocaleTexts.of(context).getText('terrain')}:',
                                        content: peoplePlanet != null ? peoplePlanet!.terrain : '',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.44,
                          padding: const EdgeInsets.all(10),
                          child: Image.asset('assets/images/planet.png')
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: DividerWithWidget(
                        child: Text(LocaleTexts.of(context).getText('starship'), style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InfoWidget(
                            title: '${LocaleTexts.of(context).getText('starship_name')}:',
                            content: peopleStarship != null ? peopleStarship!.name : 'None',
                          ),
                          
                          InfoWidget(
                            title: '${LocaleTexts.of(context).getText('capacity')}:',
                            content: peopleStarship != null ? peopleStarship!.cargo_capacity: 'None',
                          ),                          
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: DividerWithWidget(
                        child: Text(LocaleTexts.of(context).getText('films'), style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(
                      height: peopleFilms.length * 70,
                      child: ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: peopleFilms.length,
                        itemBuilder: ((context, index) => FilmSelectWidget(
                            film: peopleFilms[index],
                            people: widget.people,
                          )
                        )
                      ),
                    ),
                    const SizedBox(height: 50,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}