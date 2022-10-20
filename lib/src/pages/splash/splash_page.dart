// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:star_wars/src/api/people/people_actions.dart';
import 'package:star_wars/src/api/planets/planets_actions.dart';
import 'package:star_wars/src/pages/home/home_page.dart';
import 'package:star_wars/src/pages/splash/widgets/sky.dart';
import 'package:star_wars/src/utils/navigate.dart';

import '../../api/films/films_actions.dart';
import '../../api/starships/starships_actions.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool boolChangeLogoColor = false;
  late Timer timerChangeLogoColor;

  @override
  void initState() {
    super.initState();

    timerChangeLogoColor = Timer.periodic(const Duration(seconds: 3), (timer) {
      boolChangeLogoColor = !boolChangeLogoColor;
      setState(() {});
     });

    Timer.run(() async => await onLoad());
  }

  Future onLoad() async {
    await Future.wait([
      PeopleActions().updateAllPeoples(),
      FilmsActions().updateAllFilms(),
      PlanetsActions().updateAllPlanets(),
      StarshipsActions().updateAllStarships(),
    ]);
    
    to(context, const HomePage());
  }

  @override
  void dispose() {
    timerChangeLogoColor.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle logoStyle1 = TextStyle(color: Theme.of(context).primaryColor, fontFamily: 'Star Jedi', fontSize: 70, height: 0.8);
    TextStyle logoStyle2 = const TextStyle(color: Colors.white, fontFamily: 'Star Jedi', fontSize: 70, height: 0.8);
 
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            const Sky(),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedDefaultTextStyle(
                    style: boolChangeLogoColor ? logoStyle1 : logoStyle2, 
                    duration: const Duration(seconds: 1), 
                    child: const Text('Star')
                  ),
                  AnimatedDefaultTextStyle(
                    style: boolChangeLogoColor ? logoStyle1 : logoStyle2, 
                    duration: const Duration(seconds: 1), 
                    child: const Text('Wars')
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey.shade900,                  
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}