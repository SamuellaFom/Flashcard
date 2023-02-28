import 'package:flutter/material.dart';
import 'package:learning_game/game.dart';

// import 'game.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _State();
}

class _State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(249, 255, 255, 255),
        appBar: AppBar(
            title: const Text('Learning Game'),
            backgroundColor: Colors.purple[900]),
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              const SizedBox(height: 25),

              // Hello Again
              const Text(
                'Hello',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all( Colors.purple[900])),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return const Game();
                    }));
                  },
                  child: const Text("Start")),
            ]))));
  }
}
