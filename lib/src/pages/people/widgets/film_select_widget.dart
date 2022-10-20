import 'package:flutter/material.dart';
import 'package:star_wars/src/models/films.dart';
import 'package:star_wars/src/models/people.dart';
import 'package:star_wars/src/pages/films/film_page.dart';

import '../../../utils/navigate.dart';


class FilmSelectWidget extends StatelessWidget {
  const FilmSelectWidget({super.key, required this.film, required this.people});

  final Films film;
  final People people;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () => to(context, FilmPage(film: film, people: people,)),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 10, right: 3, left: 3),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(blurRadius: 4, color: Colors.black54, offset: Offset(0, 0))
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(film.title, style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.8), fontSize: 18),),
            Icon(Icons.keyboard_double_arrow_right_outlined, color: Theme.of(context).primaryColor.withOpacity(0.8))
          ],
        ),
      ),
    );
  }
}