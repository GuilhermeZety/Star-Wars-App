// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:star_wars/src/app/app_configs.dart';
import 'package:star_wars/src/components/top_menu_bar.dart';
import 'package:star_wars/src/pages/home/home_page.dart';
import 'package:star_wars/src/utils/cache.dart';
import 'package:star_wars/src/utils/navigate.dart';
import 'package:star_wars/src/utils/util.dart';

import '../../utils/internationalization.dart';
import 'widgets/config_option_widget.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ThemeMode theme = ThemeMode.dark;

  String language = '';
  @override
  void initState() {
    Timer.run(() async => await onLoad());
    super.initState();
  }

  onLoad() async  {
    var t = await Cache().getThemeMode();

    if(t != null){
      theme = t;
      setState(() {});
    }

    var l = await Cache().getLocale();

    if(l != null){
      language = l.languageCode;
      setState(() {});
    }
  }

  changeTheme(context){
    if(Theme.of(context).scaffoldBackgroundColor == const Color(0xFF1C1C1C)){
      AppConfigs().setThemeMode(ThemeMode.light);
      theme = ThemeMode.light;
      setState(() {});
    }
    else{
      AppConfigs().setThemeMode(ThemeMode.dark);
      theme = ThemeMode.dark;
      setState(() {});
    }
  }

  allertAllLanguagesSelect(){
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      title: const Text('Selecione a Linguagem'),
      contentPadding: const EdgeInsets.all(15),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () async {
              AppConfigs().setLocale(Locale('pt')); 
              var l = await Cache().getLocale();

              if(l != null){
                language = l.languageCode;
                setState(() {});
              }
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black12
              ),
              width: double.infinity,
              child: Text(LocaleTexts.of(context).getText('portuguese')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: () async {
              AppConfigs().setLocale(Locale('en')); 
                var l = await Cache().getLocale();

                if(l != null){
                  language = l.languageCode;
                  setState(() {});
                }
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                color: Colors.black12
                ),
                width: double.infinity,
                child: Text(LocaleTexts.of(context).getText('english')),
              ),
            ),
          ),
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopMenuBar(height: 100, name: LocaleTexts.of(context).getText('settings')),
      body: WillPopScope(
        onWillPop: () async {
          to(context, const HomePage());
          return true;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ConfigOptionWidget(
                    onTap: () => changeTheme(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LocaleTexts.of(context).getText('theme')),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          child: Text('${LocaleTexts.of(context).getText('current')}: ${simplifyThemeMode(theme.toString())}')
                        ),
                      ],
                    ),
                  ),
                  ConfigOptionWidget(
                    onTap: () async {
                      allertAllLanguagesSelect();                      
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LocaleTexts.of(context).getText('language')),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          child: Text('${LocaleTexts.of(context).getText('current')}: $language')
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}