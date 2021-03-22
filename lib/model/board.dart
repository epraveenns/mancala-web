
import 'package:json_annotation/json_annotation.dart';
import 'pit.dart';

part 'board.g.dart';

@JsonSerializable()
class Board {
  int id;

  List<Pit> pitsForPlayerZero;

  List<Pit> pitsForPlayerOne;

  Pit bigPitForPlayerZero;

  Pit bigPitForPlayerOne;

  Board(this.id, this.pitsForPlayerZero, this.pitsForPlayerOne, this.bigPitForPlayerZero, this.bigPitForPlayerOne);

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  Map<String, dynamic> toJson() => _$BoardToJson(this);
}