
import 'package:json_annotation/json_annotation.dart';
import 'package:mancala_web/model/player.dart';

import 'board.dart';
import 'gamestatus.dart';

part 'game.g.dart';

@JsonSerializable()
class Game {
  int id;

  Board board;

  Player playerZero;

  Player playerOne;

  GameStatus gameStatus;

  Player currentPlayer;

  Player? winner;

  bool tie;

  Game(this.id, this.board, this.playerZero, this.playerOne, this.gameStatus,
      this.currentPlayer, this.winner, this.tie);

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}