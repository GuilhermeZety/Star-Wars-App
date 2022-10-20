// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Planets {
  
  final String name;
  final String rotation_period;
  final String orbital_period;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final String surface_water;
  final String population;
  final List<dynamic> residents;
  final List<dynamic> films;
  final String created;
  final String edited;
  final String url;

  Planets({
    required this.name,
    required this.rotation_period,
    required this.orbital_period,
    required this.diameter,
    required this.climate,
    required this.gravity,
    required this.terrain,
    required this.surface_water,
    required this.population,
    required this.residents,
    required this.films,
    required this.created,
    required this.edited,
    required this.url,
  });

  Planets copyWith({
    String? name,
    String? rotation_period,
    String? orbital_period,
    String? diameter,
    String? climate,
    String? gravity,
    String? terrain,
    String? surface_water,
    String? population,
    List<dynamic>? residents,
    List<dynamic>? films,
    String? created,
    String? edited,
    String? url,
  }) {
    return Planets(
      name: name ?? this.name,
      rotation_period: rotation_period ?? this.rotation_period,
      orbital_period: orbital_period ?? this.orbital_period,
      diameter: diameter ?? this.diameter,
      climate: climate ?? this.climate,
      gravity: gravity ?? this.gravity,
      terrain: terrain ?? this.terrain,
      surface_water: surface_water ?? this.surface_water,
      population: population ?? this.population,
      residents: residents ?? this.residents,
      films: films ?? this.films,
      created: created ?? this.created,
      edited: edited ?? this.edited,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'rotation_period': rotation_period,
      'orbital_period': orbital_period,
      'diameter': diameter,
      'climate': climate,
      'gravity': gravity,
      'terrain': terrain,
      'surface_water': surface_water,
      'population': population,
      'residents': residents,
      'films': films,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  Map<String, dynamic> toMapDB() {
    return <String, dynamic>{
      'name': name,
      'rotation_period': rotation_period,
      'orbital_period': orbital_period,
      'diameter': diameter,
      'climate': climate,
      'gravity': gravity,
      'terrain': terrain,
      'surface_water': surface_water,
      'population': population,
      'residents': jsonEncode(residents),
      'films': jsonEncode(films),
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  factory Planets.fromMap(Map<String, dynamic> map) {
    return Planets(
      name: map['name'] as String,
      rotation_period: map['rotation_period'] as String,
      orbital_period: map['orbital_period'] as String,
      diameter: map['diameter'] as String,
      climate: map['climate'] as String,
      gravity: map['gravity'] as String,
      terrain: map['terrain'] as String,
      surface_water: map['surface_water'] as String,
      population: map['population'] as String,
      residents: map['residents'].isNotEmpty ? List<dynamic>.from(map['residents'].map((e) => e)) : [],
      films: map['films'].isNotEmpty ? List<dynamic>.from(map['films'].map((e) => e)) : [],
      created: map['created'] as String,
      edited: map['edited'] as String,
      url: map['url'] as String,
    );
  }

  factory Planets.fromMapDB(Map<String, dynamic> map) {
    return Planets(
      name: map['name'] as String,
      rotation_period: map['rotation_period'] as String,
      orbital_period: map['orbital_period'] as String,
      diameter: map['diameter'] as String,
      climate: map['climate'] as String,
      gravity: map['gravity'] as String,
      terrain: map['terrain'] as String,
      surface_water: map['surface_water'] as String,
      population: map['population'] as String,
      residents: jsonDecode(map['residents']),
      films: jsonDecode(map['films']),
      created: map['created'] as String,
      edited: map['edited'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Planets.fromJson(String source) => Planets.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Planets(name: $name, rotation_period: $rotation_period, orbital_period: $orbital_period, diameter: $diameter, climate: $climate, gravity: $gravity, terrain: $terrain, surface_water: $surface_water, population: $population, residents: $residents, films: $films, created: $created, edited: $edited, url: $url)';
  }

  @override
  bool operator ==(covariant Planets other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.rotation_period == rotation_period &&
      other.orbital_period == orbital_period &&
      other.diameter == diameter &&
      other.climate == climate &&
      other.gravity == gravity &&
      other.terrain == terrain &&
      other.surface_water == surface_water &&
      other.population == population &&
      listEquals(other.residents, residents) &&
      listEquals(other.films, films) &&
      other.created == created &&
      other.edited == edited &&
      other.url == url;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      rotation_period.hashCode ^
      orbital_period.hashCode ^
      diameter.hashCode ^
      climate.hashCode ^
      gravity.hashCode ^
      terrain.hashCode ^
      surface_water.hashCode ^
      population.hashCode ^
      residents.hashCode ^
      films.hashCode ^
      created.hashCode ^
      edited.hashCode ^
      url.hashCode;
  }
}
