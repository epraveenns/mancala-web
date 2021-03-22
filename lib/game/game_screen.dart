import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mancala_web/game/components/pit.dart';
import 'package:mancala_web/model/game.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class GameScreen extends StatefulWidget {
  Game game;

  GameScreen(this.game);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  onPitClick(int pitId) async {
    var url = Uri.parse(server + gameUri + '/' + widget.game.id.toString());
    http.Response response =
        await http.put(url, body: {'pit_id': pitId.toString()});
    if (response.statusCode >= 400) {
      var responseBody = json.decode(response.body);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(responseBody['status']),
              content: Text(responseBody['error']),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context), child: Text('Ok'))
              ],
            );
          });
    }
    Game game =
        Game.fromJson(json.decode(response.body) as Map<String, dynamic>);
    setState(() {
      widget.game = game;
    });
  }

  @override
  Widget build(BuildContext context) {
    int currentPlayer = widget.game.currentPlayer.playerNumber;
    bool isPlayerOne = currentPlayer == 0;
    bool isGameWon = widget.game.winner != null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Game ID : ${widget.game.id}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              child: Text(
                'Player ${(widget.game.winner?.playerNumber ?? 0) + 1} won',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              visible: isGameWon,
            ),
            Visibility(
              child: Text(
                'It is a tie',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              visible: widget.game.tie,
            ),
            Text(
              (isPlayerOne || isGameWon || widget.game.tie)
                  ? ''
                  : ('Player ' + (currentPlayer + 1).toString()),
              style: TextStyle(color: Colors.redAccent, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = widget.game.board.pitsForPlayerOne.length - 1;
                    i >= 0;
                    i--)
                  PitBlock(
                      widget.game.board.pitsForPlayerOne[i],
                      Colors.blueAccent,
                      isPlayerOne ? (int pitId) {} : onPitClick)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PitBlock(widget.game.board.bigPitForPlayerOne,
                    Colors.blueAccent, (int pitId) {}),
                PitBlock(widget.game.board.bigPitForPlayerZero,
                    Colors.redAccent, (int pitId) {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0;
                    i < widget.game.board.pitsForPlayerZero.length;
                    i++)
                  PitBlock(
                      widget.game.board.pitsForPlayerZero[i],
                      Colors.redAccent,
                      isPlayerOne ? onPitClick : (int pitId) {})
              ],
            ),
            Text(
              isPlayerOne && !(isGameWon || widget.game.tie)
                  ? ('Player ' + (currentPlayer + 1).toString())
                  : '',
              style: TextStyle(color: Colors.blueAccent, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
