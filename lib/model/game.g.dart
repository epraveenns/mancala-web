// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    json['id'] as int,
    Board.fromJson(json['board'] as Map<String, dynamic>),
    Player.fromJson(json['player0'] as Map<String, dynamic>),
    Player.fromJson(json['player1'] as Map<String, dynamic>),
    _$enumDecode(_$GameStatusEnumMap, json['gameStatus']),
    Player.fromJson(json['currentPlayer'] as Map<String, dynamic>),
    json['winner'] == null
        ? null
        : Player.fromJson(json['winner'] as Map<String, dynamic>),
    json['tie'] as bool,
  );
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'board': instance.board.toJson(),
      'player0': instance.player0.toJson(),
      'player1': instance.player1.toJson(),
      'gameStatus': _$GameStatusEnumMap[instance.gameStatus],
      'currentPlayer': instance.currentPlayer.toJson(),
      'winner': instance.winner?.toJson(),
      'tie': instance.tie,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$GameStatusEnumMap = {
  GameStatus.IN_PROGRESS: 'IN_PROGRESS',
  GameStatus.GAMEOVER: 'GAMEOVER',
};
