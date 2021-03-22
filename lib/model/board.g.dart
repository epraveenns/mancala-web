// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) {
  return Board(
    json['id'] as int,
    (json['pitsForPlayerZero'] as List<dynamic>)
        .map((e) => Pit.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['pitsForPlayerOne'] as List<dynamic>)
        .map((e) => Pit.fromJson(e as Map<String, dynamic>))
        .toList(),
    Pit.fromJson(json['bigPitForPlayerZero'] as Map<String, dynamic>),
    Pit.fromJson(json['bigPitForPlayerOne'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'id': instance.id,
      'pitsForPlayerZero':
          instance.pitsForPlayerZero.map((e) => e.toJson()).toList(),
      'pitsForPlayerOne':
          instance.pitsForPlayerOne.map((e) => e.toJson()).toList(),
      'bigPitForPlayerZero': instance.bigPitForPlayerZero.toJson(),
      'bigPitForPlayerOne': instance.bigPitForPlayerOne.toJson(),
    };
