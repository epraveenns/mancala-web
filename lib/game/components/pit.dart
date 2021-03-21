import 'package:flutter/material.dart';
import 'package:mancala_web/model/pit.dart';

class PitBlock extends StatefulWidget {
  final Pit pit;
  final Color color;
  final Function onPitClick;

  PitBlock(this.pit, this.color, this.onPitClick);

  @override
  _PitBlockState createState() => _PitBlockState();
}

class _PitBlockState extends State<PitBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(widget.color)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            widget.pit.coinsCount.toString(),
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
        ),
        onPressed: () {
          widget.onPitClick(widget.pit.id);
        },
      ),
    );
  }
}
