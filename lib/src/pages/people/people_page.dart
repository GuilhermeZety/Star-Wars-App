import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'people_viewmodel.dart';

import '../../components/divider.dart';
import '../../components/top_menu_bar.dart';
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
  var controller = PeopleViewModel();

  @override
  void initState() {
    Timer.run(() async => await controller.onLoad(widget.people));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          child: Observer(
            builder: (e) => ScrollConfiguration(
              behavior: MyBehavior(), 
              child: 
                controller.loading ? 
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
                                      content: controller.peoplePlanet != null ? controller.peoplePlanet!.name : '',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: InfoWidget(
                                        title: '${LocaleTexts.of(context).getText('diameter')}:',
                                        content: controller.peoplePlanet != null ? '${controller.peoplePlanet!.diameter} km' : '',
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
                                          content: controller.peoplePlanet != null ? controller.peoplePlanet!.terrain : '',
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
                              content: controller.peopleStarship != null ? controller.peopleStarship!.name : 'None',
                            ),
                            
                            InfoWidget(
                              title: '${LocaleTexts.of(context).getText('capacity')}:',
                              content: controller.peopleStarship != null ? controller.peopleStarship!.cargo_capacity: 'None',
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
                        height: controller.peopleFilms.length * 70,
                        child: ListView.builder(
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.peopleFilms.length,
                          itemBuilder: ((context, index) => FilmSelectWidget(
                              film: controller.peopleFilms[index],
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
      ),
    );
  }
}