import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mancala_web/game/game_screen.dart';
import 'package:mancala_web/model/game.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
  final _gameIdController = TextEditingController();

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
            ElevatedButton(onPressed: () {

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Enter Game ID"),
                      content: TextField(
                        decoration: new InputDecoration(labelText: "Enter Game ID"),
                        keyboardType: TextInputType.number,
                        controller: _gameIdController,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                      ),
                      actions: [
                        TextButton(
                          child: Text('Enter'),
                          onPressed: () async {
                            assert (_gameIdController.text.isNotEmpty);
                            var url = Uri.parse(server + gameUri + "/" + _gameIdController.text);
                            http.Response response = await http.get(url);
                            Game game = Game.fromJson(json.decode(response.body) as Map<String, dynamic>);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(game)));
                          },
                        ),
                      ],
                    );
                  });

            }, child: Text('Continue old game')),
          ],
        ),
      ),
    );
  }
}
