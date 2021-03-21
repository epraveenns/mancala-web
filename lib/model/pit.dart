
import 'package:json_annotation/json_annotation.dart';
import 'package:mancala_web/model/player.dart';

part 'pit.g.dart';


@JsonSerializable()
class Pit {
  int id;

  int coinsCount;

  int next;

  Player owner;

  int? opposite;

  Pit(this.id, this.coinsCount, this.next, this.owner, this.opposite);

  factory Pit.fromJson(Map<String, dynamic> json) => _$PitFromJson(json);

  Map<String, dynamic> toJson() => _$PitToJson(this);
}