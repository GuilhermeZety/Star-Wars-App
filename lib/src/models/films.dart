// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Films {
  final int episode_id;
  final String title;
  final String opening_crawl;
  final String director;
  final String producer;
  final String release_date;
  final List<dynamic> characters;
  final List<dynamic> planets;
  final List<dynamic> starships;
  final List<dynamic> vehicles;
  final List<dynamic> species;
  final String created;
  final String edited;
  final String url;

  Films({
    required this.episode_id,
    required this.title,
    required this.opening_crawl,
    required this.director,
    required this.producer,
    required this.release_date,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    required this.created,
    required this.edited,
    required this.url,
  });

  Films copyWith({
    int? episode_id,
    String? title,
    String? opening_crawl,
    String? director,
    String? producer,
    String? release_date,
    List<dynamic>? characters,
    List<dynamic>? planets,
    List<dynamic>? starships,
    List<dynamic>? vehicles,
    List<dynamic>? species,
    String? created,
    String? edited,
    String? url,
  }) {
    return Films(
      episode_id: episode_id ?? this.episode_id,
      title: title ?? this.title,
      opening_crawl: opening_crawl ?? this.opening_crawl,
      director: director ?? this.director,
      producer: producer ?? this.producer,
      release_date: release_date ?? this.release_date,
      characters: characters ?? this.characters,
      planets: planets ?? this.planets,
      starships: starships ?? this.starships,
      vehicles: vehicles ?? this.vehicles,
      species: species ?? this.species,
      created: created ?? this.created,
      edited: edited ?? this.edited,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'episode_id': episode_id,
      'title': title,
      'opening_crawl': opening_crawl,
      'director': director,
      'producer': producer,
      'release_date': release_date,
      'characters': characters,
      'planets': planets,
      'starships': starships,
      'vehicles': vehicles,
      'species': species,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  Map<String, dynamic> toMapDB() {
    return <String, dynamic>{
      'episode_id': episode_id,
      'title': title,
      'opening_crawl': opening_crawl,
      'director': director,
      'producer': producer,
      'release_date': release_date,
      'characters': jsonEncode(characters),
      'planets': jsonEncode(planets),
      'starships': jsonEncode(starships),
      'vehicles': jsonEncode(vehicles),
      'species': jsonEncode(species),
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  factory Films.fromMap(Map<String, dynamic> map) {
    return Films(
      episode_id: map['episode_id'] as int,
      title: map['title'] as String,
      opening_crawl: map['opening_crawl'] as String,
      director: map['director'] as String,
      producer: map['producer'] as String,
      release_date: map['release_date'] as String,
      characters: map['characters'].isNotEmpty ? List<String>.from(map['characters'].map((e) => e)) : [],
      planets: map['planets'].isNotEmpty ? List<String>.from(map['planets'].map((e) => e)) : [],
      starships: map['starships'].isNotEmpty ? List<String>.from(map['starships'].map((e) => e)) : [],
      vehicles: map['vehicles'].isNotEmpty ? List<String>.from(map['vehicles'].map((e) => e)) : [],
      species: map['species'].isNotEmpty ? List<String>.from(map['species'].map((e) => e)) : [],
      created: map['created'] as String,
      edited: map['edited'] as String,
      url: map['url'] as String,
    );
  }

  factory Films.fromMapDB(Map<String, dynamic> map) {
    return Films(
      episode_id: map['episode_id'] as int,
      title: map['title'] as String,
      opening_crawl: map['opening_crawl'] as String,
      director: map['director'] as String,
      producer: map['producer'] as String,
      release_date: map['release_date'] as String,
      characters: jsonDecode(map['characters']),
      planets: jsonDecode(map['planets']),
      starships: jsonDecode(map['starships']),
      vehicles: jsonDecode(map['vehicles']),
      species: jsonDecode(map['species']),
      created: map['created'] as String,
      edited: map['edited'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Films.fromJson(String source) => Films.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Films(episode_id: $episode_id, title: $title, opening_crawl: $opening_crawl, director: $director, producer: $producer, release_date: $release_date, characters: $characters, planets: $planets, starships: $starships, vehicles: $vehicles, species: $species, created: $created, edited: $edited, url: $url)';
  }

  @override
  bool operator ==(covariant Films other) {
    if (identical(this, other)) return true;
  
    return 
      other.episode_id == episode_id &&
      other.title == title &&
      other.opening_crawl == opening_crawl &&
      other.director == director &&
      other.producer == producer &&
      other.release_date == release_date &&
      listEquals(other.characters, characters) &&
      listEquals(other.planets, planets) &&
      listEquals(other.starships, starships) &&
      listEquals(other.vehicles, vehicles) &&
      listEquals(other.species, species) &&
      other.created == created &&
      other.edited == edited &&
      other.url == url;
  }

  @override
  int get hashCode {
    return episode_id.hashCode ^
      title.hashCode ^
      opening_crawl.hashCode ^
      director.hashCode ^
      producer.hashCode ^
      release_date.hashCode ^
      characters.hashCode ^
      planets.hashCode ^
      starships.hashCode ^
      vehicles.hashCode ^
      species.hashCode ^
      created.hashCode ^
      edited.hashCode ^
      url.hashCode;
  }
}
