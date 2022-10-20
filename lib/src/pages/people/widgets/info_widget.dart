import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.title, required this.content, this.width = 160});

  final String title;
  final String content;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.headline6!.color), textAlign: TextAlign.center,),
        SizedBox(
          width: width,
          child: Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(content, style: TextStyle(fontSize: 18, color: Theme.of(context).textTheme.headline1!.color), textAlign: TextAlign.start,),
            ),
          ),
        ),
      ],
    );
  }
}