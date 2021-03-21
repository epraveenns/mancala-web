
import 'package:json_annotation/json_annotation.dart';
import 'pit.dart';

part 'board.g.dart';

@JsonSerializable()
class Board {
  int id;

  List<Pit> pits0;

  List<Pit> pits1;

  Pit mancala0;

  Pit mancala1;

  Board(this.id, this.pits0, this.pits1, this.mancala0, this.mancala1);

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  Map<String, dynamic> toJson() => _$BoardToJson(this);
}