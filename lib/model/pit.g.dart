// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pit _$PitFromJson(Map<String, dynamic> json) {
  return Pit(
    json['id'] as int,
    json['coinsCount'] as int,
    json['next'] as int,
    Player.fromJson(json['owner'] as Map<String, dynamic>),
    json['opposite'] as int?,
  );
}

Map<String, dynamic> _$PitToJson(Pit instance) => <String, dynamic>{
      'id': instance.id,
      'coinsCount': instance.coinsCount,
      'next': instance.next,
      'owner': instance.owner.toJson(),
      'opposite': instance.opposite,
    };
