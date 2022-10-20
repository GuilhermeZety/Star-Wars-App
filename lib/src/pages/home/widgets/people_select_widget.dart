import 'package:flutter/material.dart';

import '../../../models/people.dart';
import '../../../utils/navigate.dart';
import '../../../utils/util.dart';
import '../../people/people_page.dart';

class PeopleSelectWidget extends StatelessWidget {
  const PeopleSelectWidget({super.key, required this.people});

  final People people;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () => to(context, PeoplePage(people: people)),
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 10, right: 3, left: 3),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(blurRadius: 4, color: Colors.black54, offset: Offset(0, 0))
          ]
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(people.name, style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.8), fontSize: 18),)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(genderTradutor(context, people.gender), style: const TextStyle(fontSize: 14),),
                Text('${people.height} cm', style: const TextStyle(fontSize: 14),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}