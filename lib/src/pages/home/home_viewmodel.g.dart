// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModel, Store {
  late final _$scrollControllerAtom =
      Atom(name: '_HomeViewModel.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$searchControllerAtom =
      Atom(name: '_HomeViewModel.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$listAllPersonsAtom =
      Atom(name: '_HomeViewModel.listAllPersons', context: context);

  @override
  List<People> get listAllPersons {
    _$listAllPersonsAtom.reportRead();
    return super.listAllPersons;
  }

  @override
  set listAllPersons(List<People> value) {
    _$listAllPersonsAtom.reportWrite(value, super.listAllPersons, () {
      super.listAllPersons = value;
    });
  }

  late final _$listPersonsAtom =
      Atom(name: '_HomeViewModel.listPersons', context: context);

  @override
  List<People> get listPersons {
    _$listPersonsAtom.reportRead();
    return super.listPersons;
  }

  @override
  set listPersons(List<People> value) {
    _$listPersonsAtom.reportWrite(value, super.listPersons, () {
      super.listPersons = value;
    });
  }

  late final _$_HomeViewModelActionController =
      ActionController(name: '_HomeViewModel', context: context);

  @override
  void setSearchControllerText(String _) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setSearchControllerText');
    try {
      return super.setSearchControllerText(_);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListAllPersons(List<People> _) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setListAllPersons');
    try {
      return super.setListAllPersons(_);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListPersons(List<People> _) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setListPersons');
    try {
      return super.setListPersons(_);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scrollController: ${scrollController},
searchController: ${searchController},
listAllPersons: ${listAllPersons},
listPersons: ${listPersons}
    ''';
  }
}
