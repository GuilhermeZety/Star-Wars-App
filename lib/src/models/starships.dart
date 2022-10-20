// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Starships {
  final String name;
  final String model;
  final String manufacturer;
  final String cost_in_credits;
  final String length;
  final String max_atmosphering_speed;
  final String crew;
  final String passengers;
  final String cargo_capacity;
  final String consumables;
  final String hyperdrive_rating;
  final String MGLT;
  final String starship_class;
  final List<dynamic> pilots;
  final List<dynamic> films;
  final String created;
  final String edited;
  final String url;
  
  Starships({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.cost_in_credits,
    required this.length,
    required this.max_atmosphering_speed,
    required this.crew,
    required this.passengers,
    required this.cargo_capacity,
    required this.consumables,
    required this.hyperdrive_rating,
    required this.MGLT,
    required this.starship_class,
    required this.pilots,
    required this.films,
    required this.created,
    required this.edited,
    required this.url,
  });

  Starships copyWith({
    String? name,
    String? model,
    String? manufacturer,
    String? cost_in_credits,
    String? length,
    String? max_atmosphering_speed,
    String? crew,
    String? passengers,
    String? cargo_capacity,
    String? consumables,
    String? hyperdrive_rating,
    String? MGLT,
    String? starship_class,
    List<dynamic>? pilots,
    List<dynamic>? films,
    String? created,
    String? edited,
    String? url,
  }) {
    return Starships(
      name: name ?? this.name,
      model: model ?? this.model,
      manufacturer: manufacturer ?? this.manufacturer,
      cost_in_credits: cost_in_credits ?? this.cost_in_credits,
      length: length ?? this.length,
      max_atmosphering_speed: max_atmosphering_speed ?? this.max_atmosphering_speed,
      crew: crew ?? this.crew,
      passengers: passengers ?? this.passengers,
      cargo_capacity: cargo_capacity ?? this.cargo_capacity,
      consumables: consumables ?? this.consumables,
      hyperdrive_rating: hyperdrive_rating ?? this.hyperdrive_rating,
      MGLT: MGLT ?? this.MGLT,
      starship_class: starship_class ?? this.starship_class,
      pilots: pilots ?? this.pilots,
      films: films ?? this.films,
      created: created ?? this.created,
      edited: edited ?? this.edited,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'model': model,
      'manufacturer': manufacturer,
      'cost_in_credits': cost_in_credits,
      'length': length,
      'max_atmosphering_speed': max_atmosphering_speed,
      'crew': crew,
      'passengers': passengers,
      'cargo_capacity': cargo_capacity,
      'consumables': consumables,
      'hyperdrive_rating': hyperdrive_rating,
      'MGLT': MGLT,
      'starship_class': starship_class,
      'pilots': pilots,
      'films': films,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  Map<String, dynamic> toMapDB() {
    return <String, dynamic>{
      'name': name,
      'model': model,
      'manufacturer': manufacturer,
      'cost_in_credits': cost_in_credits,
      'length': length,
      'max_atmosphering_speed': max_atmosphering_speed,
      'crew': crew,
      'passengers': passengers,
      'cargo_capacity': cargo_capacity,
      'consumables': consumables,
      'hyperdrive_rating': hyperdrive_rating,
      'MGLT': MGLT,
      'starship_class': starship_class,
      'pilots': jsonEncode(pilots),
      'films': jsonEncode(films),
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  factory Starships.fromMap(Map<String, dynamic> map) {
    return Starships(
      name: map['name'] as String,
      model: map['model'] as String,
      manufacturer: map['manufacturer'] as String,
      cost_in_credits: map['cost_in_credits'] as String,
      length: map['length'] as String,
      max_atmosphering_speed: map['max_atmosphering_speed'] as String,
      crew: map['crew'] as String,
      passengers: map['passengers'] as String,
      cargo_capacity: map['cargo_capacity'] as String,
      consumables: map['consumables'] as String,
      hyperdrive_rating: map['hyperdrive_rating'] as String,
      MGLT: map['MGLT'] as String,
      starship_class: map['starship_class'] as String,
      pilots: map['pilots'].isNotEmpty ? List<dynamic>.from(map['pilots'].map((e) => e)) : [],
      films: map['films'].isNotEmpty ? List<dynamic>.from(map['films'].map((e) => e)) : [],
      created: map['created'] as String,
      edited: map['edited'] as String,
      url: map['url'] as String,
    );
  }

  factory Starships.fromMapDB(Map<String, dynamic> map) {
    return Starships(
      name: map['name'] as String,
      model: map['model'] as String,
      manufacturer: map['manufacturer'] as String,
      cost_in_credits: map['cost_in_credits'] as String,
      length: map['length'] as String,
      max_atmosphering_speed: map['max_atmosphering_speed'] as String,
      crew: map['crew'] as String,
      passengers: map['passengers'] as String,
      cargo_capacity: map['cargo_capacity'] as String,
      consumables: map['consumables'] as String,
      hyperdrive_rating: map['hyperdrive_rating'] as String,
      MGLT: map['MGLT'] as String,
      starship_class: map['starship_class'] as String,
      pilots: jsonDecode(map['pilots']),
      films: jsonDecode(map['films']),
      created: map['created'] as String,
      edited: map['edited'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Starships.fromJson(String source) => Starships.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Starships(name: $name, model: $model, manufacturer: $manufacturer, cost_in_credits: $cost_in_credits, length: $length, max_atmosphering_speed: $max_atmosphering_speed, crew: $crew, passengers: $passengers, cargo_capacity: $cargo_capacity, consumables: $consumables, hyperdrive_rating: $hyperdrive_rating, MGLT: $MGLT, starship_class: $starship_class, pilots: $pilots, films: $films, created: $created, edited: $edited, url: $url)';
  }

  @override
  bool operator ==(covariant Starships other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.model == model &&
      other.manufacturer == manufacturer &&
      other.cost_in_credits == cost_in_credits &&
      other.length == length &&
      other.max_atmosphering_speed == max_atmosphering_speed &&
      other.crew == crew &&
      other.passengers == passengers &&
      other.cargo_capacity == cargo_capacity &&
      other.consumables == consumables &&
      other.hyperdrive_rating == hyperdrive_rating &&
      other.MGLT == MGLT &&
      other.starship_class == starship_class &&
      listEquals(other.pilots, pilots) &&
      listEquals(other.films, films) &&
      other.created == created &&
      other.edited == edited &&
      other.url == url;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      model.hashCode ^
      manufacturer.hashCode ^
      cost_in_credits.hashCode ^
      length.hashCode ^
      max_atmosphering_speed.hashCode ^
      crew.hashCode ^
      passengers.hashCode ^
      cargo_capacity.hashCode ^
      consumables.hashCode ^
      hyperdrive_rating.hashCode ^
      MGLT.hashCode ^
      starship_class.hashCode ^
      pilots.hashCode ^
      films.hashCode ^
      created.hashCode ^
      edited.hashCode ^
      url.hashCode;
  }
}
