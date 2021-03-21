// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) {
  return Board(
    json['id'] as int,
    (json['pits0'] as List<dynamic>)
        .map((e) => Pit.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['pits1'] as List<dynamic>)
        .map((e) => Pit.fromJson(e as Map<String, dynamic>))
        .toList(),
    Pit.fromJson(json['mancala0'] as Map<String, dynamic>),
    Pit.fromJson(json['mancala1'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'id': instance.id,
      'pits0': instance.pits0.map((e) => e.toJson()).toList(),
      'pits1': instance.pits1.map((e) => e.toJson()).toList(),
      'mancala0': instance.mancala0.toJson(),
      'mancala1': instance.mancala1.toJson(),
    };
