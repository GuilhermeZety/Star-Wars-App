import 'dart:async';

import 'package:flutter/material.dart';
import 'package:star_wars/src/api/people/people_database.dart';
import 'package:star_wars/src/models/people.dart';
import 'package:star_wars/src/pages/configs/config_page.dart';
import 'package:star_wars/src/utils/navigate.dart';

import '../../components/search_input.dart';
import '../../utils/internationalization.dart';
import 'widgets/people_select_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController(); 

  List<People> listAllPersons = [];
  List<People> listPersons = [];

  Timer? searching;


  @override
  void initState() {
    super.initState();

    Timer.run(() async => onload());
  }

  onload() async {
    listAllPersons = await PeopleDatabase().getAll();
    listPersons = listAllPersons;

    setState(() {});
  }

  onSearch(String name){
    if(searching != null){
      searching!.cancel();
    }

    Timer(const Duration(milliseconds: 50), () {
      changePeoples(name);
    });

  }

  changePeoples(String name) async {
    if(name.isEmpty){
      listPersons = listAllPersons;
    }
    else{
      listPersons = listAllPersons.where((element) => element.name.toUpperCase().contains(name.toUpperCase())).toList();
    }
    setState(() {});
  }


  @override
  void dispose() {
    searchController.dispose();   
    if(searching != null){
      searching!.cancel();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),      
      child: Scaffold(
        appBar: AppBar(
          title: Text('Star Wars', style: TextStyle(color: Theme.of(context).textTheme.headline1!.color, fontFamily: 'Star Jedi', fontSize: 35),),
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 0,
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 5),
                  child: IconButton(onPressed: () => to(context, const ConfigPage()), icon: Icon(Icons.settings, size: 35, color: Colors.grey.shade600,)),
                ),
              ],
            )
          ],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SearchInput(
                      controller: searchController,
                      hint: LocaleTexts.of(context).getText('search'),
                      onChange: onSearch,
                      countData: '${listPersons.length} ${LocaleTexts.of(context).getText('results')}',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 273,
                    child: ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listPersons.length,
                      itemBuilder: ((context, index) => PeopleSelectWidget(
                          people: listPersons[index]
                        )
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}