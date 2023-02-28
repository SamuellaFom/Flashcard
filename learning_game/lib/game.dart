import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:learning_game/flashcard.dart';
import 'package:learning_game/flashcard_view.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<StatefulWidget> createState() => _GameState();
}

class _GameState extends State<Game> {
  final List<Flashcard> _flashcards = [
    Flashcard(
        question: "Past Simple of become ?",
        answer: "became"),
    Flashcard(question: "translated from chide ?", answer: "gronder/réprimander"),
    Flashcard(
        question: "Past participle of catch ?",
        answer: "caught"),
    Flashcard(question: "Infinitive of held?", answer: "hold"),
    Flashcard(
        question: "Past Simple of teach?",
        answer: "taught"),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xffF8F8F8),
            appBar: AppBar(
                title: const Text('Time'), backgroundColor: Colors.purple[900]),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: FlipCard(
                      front: FlashcardView(
                        text: _flashcards[_currentIndex].question,
                      ),
                      back: FlashcardView(
                          text: _flashcards[_currentIndex].answer)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton.icon(
                        onPressed: showPreviousCard,
                        icon: const Icon(Icons.chevron_left),
                        label: const Text('Prev')),
                    OutlinedButton.icon(
                        onPressed: showNextCard,
                        icon: const Icon(Icons.chevron_right),
                        label: const Text('Next')),
                  ],
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple[900])),
                    onPressed: () {
                      // Navigate back to first route when tapped.
                      Navigator.pop(context);
                    },
                    child: const Text("Quit")
                  )
              ],
            ))));
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
