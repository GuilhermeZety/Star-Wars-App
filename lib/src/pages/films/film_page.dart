import 'package:flutter/material.dart';
import 'package:star_wars/src/models/films.dart';
import 'package:star_wars/src/models/people.dart';
import 'package:star_wars/src/pages/people/people_page.dart';
import 'package:star_wars/src/utils/navigate.dart';

import '../../components/divider.dart';
import '../../components/top_menu_bar.dart';
import '../../utils/behavior.dart';
import '../../utils/internationalization.dart';

class FilmPage extends StatefulWidget {
  const FilmPage({super.key, required this.film, required this.people});

  final Films film;
  final People people;

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopMenuBar(height: 100, name: LocaleTexts.of(context).getText('film'), backPage: PeoplePage(people: widget.people)),
      body: WillPopScope(
        onWillPop: (() async {
          to(context, PeoplePage(people: widget.people));
          return true;
        }),
        child: ScrollConfiguration(
            behavior: MyBehavior(), 
            child:  SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/images/star-wars-logo.png'),
                  ),
                  Text('${widget.film.title} ( ${widget.people.name} )', style: TextStyle(fontSize: 25, color: Theme.of(context).primaryColor), textAlign: TextAlign.center,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.film.release_date)
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: DividerWithWidget(
                      child: null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('${LocaleTexts.of(context).getText('director')}: ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(widget.film.director, style: const TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text('${LocaleTexts.of(context).getText('producers')}: ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(widget.film.producer, style: const TextStyle(fontSize: 16)),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: DividerWithWidget(
                      child: Text(LocaleTexts.of(context).getText('opening_crawl'), style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.film.opening_crawl, style: TextStyle(color: Theme.of(context).primaryColor), textAlign: TextAlign.center,)
                      ],
                    ),
                  )
                ]
              )
            ),
          ),
        ),
      ),
    );
  }
}