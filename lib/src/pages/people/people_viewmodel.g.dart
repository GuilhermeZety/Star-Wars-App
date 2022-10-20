// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PeopleViewModel on _PeopleViewModel, Store {
  late final _$scrollControllerAtom =
      Atom(name: '_PeopleViewModel.scrollController', context: context);

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

  late final _$peoplePlanetAtom =
      Atom(name: '_PeopleViewModel.peoplePlanet', context: context);

  @override
  Planets? get peoplePlanet {
    _$peoplePlanetAtom.reportRead();
    return super.peoplePlanet;
  }

  @override
  set peoplePlanet(Planets? value) {
    _$peoplePlanetAtom.reportWrite(value, super.peoplePlanet, () {
      super.peoplePlanet = value;
    });
  }

  late final _$peopleStarshipAtom =
      Atom(name: '_PeopleViewModel.peopleStarship', context: context);

  @override
  Starships? get peopleStarship {
    _$peopleStarshipAtom.reportRead();
    return super.peopleStarship;
  }

  @override
  set peopleStarship(Starships? value) {
    _$peopleStarshipAtom.reportWrite(value, super.peopleStarship, () {
      super.peopleStarship = value;
    });
  }

  late final _$peopleFilmsAtom =
      Atom(name: '_PeopleViewModel.peopleFilms', context: context);

  @override
  List<Films> get peopleFilms {
    _$peopleFilmsAtom.reportRead();
    return super.peopleFilms;
  }

  @override
  set peopleFilms(List<Films> value) {
    _$peopleFilmsAtom.reportWrite(value, super.peopleFilms, () {
      super.peopleFilms = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_PeopleViewModel.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_PeopleViewModelActionController =
      ActionController(name: '_PeopleViewModel', context: context);

  @override
  void setPeoplePlanet(Planets _) {
    final _$actionInfo = _$_PeopleViewModelActionController.startAction(
        name: '_PeopleViewModel.setPeoplePlanet');
    try {
      return super.setPeoplePlanet(_);
    } finally {
      _$_PeopleViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPeopleStarship(Starships _) {
    final _$actionInfo = _$_PeopleViewModelActionController.startAction(
        name: '_PeopleViewModel.setPeopleStarship');
    try {
      return super.setPeopleStarship(_);
    } finally {
      _$_PeopleViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPeopleFilms(List<Films> _) {
    final _$actionInfo = _$_PeopleViewModelActionController.startAction(
        name: '_PeopleViewModel.setPeopleFilms');
    try {
      return super.setPeopleFilms(_);
    } finally {
      _$_PeopleViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool _) {
    final _$actionInfo = _$_PeopleViewModelActionController.startAction(
        name: '_PeopleViewModel.setLoading');
    try {
      return super.setLoading(_);
    } finally {
      _$_PeopleViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scrollController: ${scrollController},
peoplePlanet: ${peoplePlanet},
peopleStarship: ${peopleStarship},
peopleFilms: ${peopleFilms},
loading: ${loading}
    ''';
  }
}
