import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../configs/config_page.dart';
import 'home_viewmodel.dart';
import '../../utils/navigate.dart';

import '../../components/search_input.dart';
import '../../utils/internationalization.dart';
import 'widgets/people_select_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = HomeViewModel();

  @override
  void initState() {
    Timer.run(() async => await controller.onload());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose(); 
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
                    child: Observer(
                      builder: (a) => SearchInput(
                        controller: controller.searchController,
                        hint: LocaleTexts.of(context).getText('search'),
                        onChange: controller.onSearch,
                        countData: '${controller.listPersons.length} ${LocaleTexts.of(context).getText('results')}',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 273,
                    child: Observer(
                      builder: (a) => ListView.builder(
                        controller: controller.scrollController,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.listPersons.length,
                        itemBuilder: ((context, index) => PeopleSelectWidget(
                            people: controller.listPersons[index]
                          )
                        )
                      ),
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