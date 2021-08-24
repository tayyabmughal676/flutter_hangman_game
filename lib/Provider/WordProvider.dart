import 'package:flutter/material.dart';
import "dart:math";

//*
// Save Player Game Score
// Old Game History
// Keyboard disable!
//
// *//

class WordProvider extends ChangeNotifier {
  int wordCounter = 0;
  int currentScore = 0;
  int changeImageIndex = 0;

  String guessWord = "_ _ _ _";
  String newGuessWord = "_ _ _ _";
  List<String> showDashes = [];

  WordProvider() {
    currentScoreIncrement();
    getGuessWord();
    changeImageIndex = 0;
    currentScore = 0;
  }

  List imageList = [
    AssetImage("assets/images/0.png"),
    AssetImage("assets/images/1.png"),
    AssetImage("assets/images/2.png"),
    AssetImage("assets/images/3.png"),
    AssetImage("assets/images/4.png"),
    AssetImage("assets/images/5.png"),
    AssetImage("assets/images/6.png"),
  ];

  List<String> wordList = [
    "THOR",
    "IRONMAN",
    "IMRAN",
    "YOUNG",
    "SHOT",
    "PINK",
    "THANOS"
  ];

  // Print Clicked Button
  playerPressedWord(String currentWord, context) {
    newGuessWord = currentWord;
    readGuessWordCharacters(newGuessWord, context);
    notifyListeners();
  }

  getGuessWord() {
    wordCounter += 1;

    var rand = Random();
    int wordlistLength = wordList.length;
    int randWord = rand.nextInt(wordlistLength);

    if (wordCounter - 1 == wordList.length) {
      // print("wordlist" + wordList[randWord]);
    } else {
      randWord = rand.nextInt(wordlistLength);
      guessWord = wordList[randWord];

      var l = guessWord.length;
      for (var d = -0; d < l; d++) {
        showDashes.add("_");
      }
      print("Random Guess Word: $guessWord");
      notifyListeners();
    }
  }

  readGuessWordCharacters(String playerPressedWord, BuildContext context) {
    var l = guessWord.length;
    bool match = false;

    for (int i = 0; i < l; i++) {
      if (playerPressedWord == guessWord[i]) {
        showDashes[i] = playerPressedWord;
        match = true;
        // print(showDashes);
      } else {
        print("Word Not Matched...");
        // print(imageList[changeImage++]);
      }
    }
    // if showDashes has any "_" count would be increase
    var count = 0;
    for (var t in showDashes) {
      if (t == "_") {
        count++;
      }
    }

    // if count == 0 means no dashes in list
    if (count == 0) {
      showAlertMessage(context, "Congrats!", "Winner, Winner, Hangman Saver!",
          false, guessWord);
    }
    // if changeImage not equal to full list.length increase the index
    if (changeImageIndex != 6 && !match) {
      changeImageIndex++;
    }
    notifyListeners();
  }

  gameRestart() {
    showDashes = [];
    currentScoreIncrement();
    getGuessWord();
    wordCounter = 0;
    currentScore = 0;
    changeImageIndex = 0;
    print("Game Restart");
  }

  keyboardButtonPressed() {
    bool isWordButtonDisable = false;
    isWordButtonDisable = !isWordButtonDisable;
    notifyListeners();
    return isWordButtonDisable;
  }

  currentScoreIncrement() {
    currentScore++;
    notifyListeners();
  }

  favoriteButtonPressed() {
    bool isFavorite = false;
    isFavorite = !isFavorite;
    notifyListeners();
    return isFavorite;
  }

  void showAlertMessage(BuildContext context, String title, String message,
      bool isHint, String? guessWord) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: Text(message + guessWord!),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 3.0,
                  padding: EdgeInsets.all(4.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
              child: Text(isHint ? "OK" : "Restart"),
              onPressed: () {
                Navigator.of(context).pop();
                isHint ? "" : gameRestart();
              },
            ),
          ],
        );
      },
    );
    notifyListeners();
  }
}
