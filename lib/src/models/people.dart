// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class People {
  final String name;
  final String height;
  final String mass;
  final String hair_color;
  final String skin_color;
  final String eye_color;
  final String birth_year;
  final String gender;
  final String homeworld;
  final List<dynamic> species;
  final List<dynamic> films;
  final List<dynamic> vehicles;
  final List<dynamic> starships;
  final String created;
  final String edited;
  final String url;
  
  People({
    required this.name,
    required this.height,
    required this.mass,
    required this.hair_color,
    required this.skin_color,
    required this.eye_color,
    required this.birth_year,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  People copyWith({
    String? name,
    String? height,
    String? mass,
    String? hair_color,
    String? skin_color,
    String? eye_color,
    String? birth_year,
    String? gender,
    String? homeworld,
    List<dynamic>? films,
    List<dynamic>? species,
    List<dynamic>? vehicles,
    List<dynamic>? starships,
    String? created,
    String? edited,
    String? url,
  }) {
    return People(
      name: name ?? this.name,
      height: height ?? this.height,
      mass: mass ?? this.mass,
      hair_color: hair_color ?? this.hair_color,
      skin_color: skin_color ?? this.skin_color,
      eye_color: eye_color ?? this.eye_color,
      birth_year: birth_year ?? this.birth_year,
      gender: gender ?? this.gender,
      homeworld: homeworld ?? this.homeworld,
      films: films ?? this.films,
      species: species ?? this.species,
      vehicles: vehicles ?? this.vehicles,
      starships: starships ?? this.starships,
      created: created ?? this.created,
      edited: edited ?? this.edited,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'height': height,
      'mass': mass,
      'hair_color': hair_color,
      'skin_color': skin_color,
      'eye_color': eye_color,
      'birth_year': birth_year,
      'gender': gender,
      'homeworld': homeworld,
      'films': films,
      'species': species,
      'vehicles': vehicles,
      'starships': starships,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }
  Map<String, dynamic> toMapDB() {
    return <String, dynamic>{
      'name': name,
      'height': height,
      'mass': mass,
      'hair_color': hair_color,
      'skin_color': skin_color,
      'eye_color': eye_color,
      'birth_year': birth_year,
      'gender': gender,
      'homeworld': homeworld,
      'films': jsonEncode(films),
      'species': jsonEncode(species),
      'vehicles': jsonEncode(vehicles),
      'starships': jsonEncode(starships),
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  factory People.fromMap(Map<String, dynamic> map) {
    return People(
      name: map['name'] ?? 'not informed',
      height: map['height'] ?? 'not informed',
      mass: map['mass'] ?? 'not informed',
      hair_color: map['hair_color'] ?? 'not informed',
      skin_color: map['skin_color'] ?? 'not informed',
      eye_color: map['eye_color'] ?? 'not informed',
      birth_year: map['birth_year'] ?? 'not informed',
      gender: map['gender'] ?? 'not informed',
      homeworld: map['homeworld'] ?? 'not informed',
      films: map['films'].isNotEmpty ? List<String>.from(map['films'].map((e) => e)) : [],
      species: map['species'].isNotEmpty ? List<String>.from(map['species'].map((e) => e)) : [],
      vehicles: map['vehicles'].isNotEmpty ? List<String>.from(map['vehicles'].map((e) => e)) : [],
      starships: map['starships'].isNotEmpty ? List<String>.from(map['starships'].map((e) => e)) : [],
      created: map['created'] ?? 'not informed',
      edited: map['edited'] ?? 'not informed',
      url: map['url'] ?? 'not informed',
    );
  }

  factory People.fromMapDB(Map<String, dynamic> map) {
    return People(
      name: map['name'] ?? 'not informed',
      height: map['height'] ?? 'not informed',
      mass: map['mass'] ?? 'not informed',
      hair_color: map['hair_color'] ?? 'not informed',
      skin_color: map['skin_color'] ?? 'not informed',
      eye_color: map['eye_color'] ?? 'not informed',
      birth_year: map['birth_year'] ?? 'not informed',
      gender: map['gender'] ?? 'not informed',
      homeworld: map['homeworld'] ?? 'not informed',
      films: jsonDecode(map['films']),
      species: jsonDecode(map['species']),
      vehicles: jsonDecode(map['vehicles']),
      starships: jsonDecode(map['starships']),
      created: map['created'] ?? 'not informed',
      edited: map['edited'] ?? 'not informed',
      url: map['url'] ?? 'not informed',
    );
  }

  String toJson() => json.encode(toMap());

  factory People.fromJson(String source) => People.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'People(name: $name, height: $height, mass: $mass, hair_color: $hair_color, skin_color: $skin_color, eye_color: $eye_color, birth_year: $birth_year, gender: $gender, homeworld: $homeworld, films: $films, species: $species, vehicles: $vehicles, starships: $starships, created: $created, edited: $edited, url: $url)';
  }

  @override
  bool operator ==(covariant People other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.height == height &&
      other.mass == mass &&
      other.hair_color == hair_color &&
      other.skin_color == skin_color &&
      other.eye_color == eye_color &&
      other.birth_year == birth_year &&
      other.gender == gender &&
      other.homeworld == homeworld &&
      listEquals(other.films, films) &&
      other.species == species &&
      listEquals(other.vehicles, vehicles) &&
      listEquals(other.starships, starships) &&
      other.created == created &&
      other.edited == edited &&
      other.url == url;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      height.hashCode ^
      mass.hashCode ^
      hair_color.hashCode ^
      skin_color.hashCode ^
      eye_color.hashCode ^
      birth_year.hashCode ^
      gender.hashCode ^
      homeworld.hashCode ^
      films.hashCode ^
      species.hashCode ^
      vehicles.hashCode ^
      starships.hashCode ^
      created.hashCode ^
      edited.hashCode ^
      url.hashCode;
  }
}
