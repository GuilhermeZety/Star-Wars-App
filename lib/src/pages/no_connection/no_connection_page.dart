import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../splash/splash_page.dart';

import '../../utils/internationalization.dart';
import '../../utils/navigate.dart';

class NoConnectionPage extends StatefulWidget {
  const NoConnectionPage({super.key});

  @override
  State<NoConnectionPage> createState() => _NoConnectionPageState();
}

class _NoConnectionPageState extends State<NoConnectionPage> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal:  30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/svg/no-signal.svg', semanticsLabel: 'Label'),

              Text(LocaleTexts.of(context).getText('message_no_connection'), textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Color(0xFFD6D6D6))),

              SizedBox(height: 60,),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets?>(EdgeInsets.symmetric(vertical: 10, horizontal: 20))
                ),
                onPressed: () async {    
                  await to(context, SplashPage());              
                }, child: Text(LocaleTexts.of(context).getText('try_again'), style: TextStyle(fontSize: 18, color: Colors.white),)
              )
            ],
          ),
        ),
      ),
    );
  }
}