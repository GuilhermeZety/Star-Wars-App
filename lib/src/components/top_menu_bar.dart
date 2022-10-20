import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/home/home_page.dart';
import '../utils/internationalization.dart';
import '../utils/navigate.dart';


class TopMenuBar extends StatelessWidget with PreferredSizeWidget{
  const TopMenuBar({Key? key, this.backPage, required this.height, required this.name, this.backgroundColor = Colors.transparent }) : super(key: key);
  
  final double height;
  final Widget? backPage;
  final String name;
  final Color? backgroundColor;


  @override
  Size get preferredSize => Size.fromHeight(height);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      elevation: 0,
      leadingWidth: MediaQuery.of(context).size.width,
      leading: GestureDetector(
        onTap: () => to(context, backPage ?? const HomePage()),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 10),
            IconButton(
              onPressed: () => to(context, backPage ?? const HomePage()),
              icon:Icon(FontAwesomeIcons.arrowLeft, size: 20, color: Theme.of(context).secondaryHeaderColor,)
            ),
            const SizedBox(width: 10),
            Text(LocaleTexts.of(context).getText('back'), style: TextStyle(color: Theme.of(context).secondaryHeaderColor,),)
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: Row(
          children: [
            const SizedBox(width: 15),
            Container(
              height: height / 2,
              width: MediaQuery.of(context).size.width - 20,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(name, style: TextStyle(fontSize: 28, color: Theme.of(context).secondaryHeaderColor),),
              ),
            ),
          ],
        ),
      )
    );
  }
}