import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mancala_web/game/game_screen.dart';
import 'package:mancala_web/model/game.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lets play Mancala !'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  var url = Uri.parse(server + gameUri);
                  http.Response response = await http.post(url);
                  Game game = Game.fromJson(json.decode(response.body) as Map<String, dynamic>);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(game)));
                },
                child: Text('Play new game')),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Continue old game')),
          ],
        ),
      ),
    );
  }
}
