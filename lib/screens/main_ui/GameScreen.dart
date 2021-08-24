import 'package:flutter/material.dart';
import 'package:hangman_flutter/Provider/WordProvider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 29, 150, 1.0),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            //  Header
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Consumer<WordProvider>(
                builder: (context, provider, child) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          provider.favoriteButtonPressed();
                        },
                        child: Icon(
                          Icons.favorite,
                          size: 32.0,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Score: ${provider.currentScore} ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          provider.showAlertMessage(
                              context,
                              "Hint!",
                              "Please Notices the dashes length for word:)",
                              true,
                              "");
                        },
                        child: Icon(
                          Icons.lightbulb,
                          size: 32.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Spacer(),
            Consumer<WordProvider>(
              builder: (context, provider, child) {
                return Image(
                  height: 260.0,
                  width: 260.0,
                  image: provider.imageList[provider.changeImageIndex],
                );
              },
            ),

            Spacer(),
            // Show Word
            Consumer<WordProvider>(
              builder: (context, provider, child) {
                return Text(
                  "${provider.showDashes}",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              },
            ),

            //  Type Area

            Spacer(),
            Table(
              children: [
                TableRow(children: [
                  TableCell(child: CreateButton(letterText: "A")),
                  TableCell(child: CreateButton(letterText: "B")),
                  TableCell(child: CreateButton(letterText: "C")),
                  TableCell(child: CreateButton(letterText: "D")),
                  TableCell(child: CreateButton(letterText: "E")),
                  TableCell(
                    child: CreateButton(
                      letterText: "F",
                    ),
                  ),
                  TableCell(child: CreateButton(letterText: "G")),
                ]),
                TableRow(
                  children: [
                    TableCell(
                      child: CreateButton(
                        letterText: "H",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "I",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "J",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "K",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "L",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "M",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "N",
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: CreateButton(
                        letterText: "O",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "P",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "Q",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "R",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "S",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "T",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "U",
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: CreateButton(
                        letterText: "V",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "W",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "X",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "Y",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "Z",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: ":)",
                      ),
                    ),
                    TableCell(
                      child: CreateButton(
                        letterText: "(:",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class CreateButton extends StatelessWidget {
  final String letterText;

  CreateButton({Key? key, required this.letterText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Consumer<WordProvider>(
        builder: (context, provider, child) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 3.0,
                padding: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
            onPressed: () {
              if (provider.changeImageIndex != 6) {
                provider.playerPressedWord(letterText, context);
                provider.currentScoreIncrement();
              } else {
                provider.showAlertMessage(context, "Game Over",
                    "Killer, Killer, Hangman!", false, "Guess word is: " + provider.guessWord);
              }
            },
            child: Text(
              "$letterText",
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}

class DisableButton extends StatelessWidget {
  final String letterText;

  DisableButton({Key? key, required this.letterText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Consumer<WordProvider>(
        builder: (context, provider, child) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 3.0,
                padding: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(20.0),
                    )),
            onPressed: () {
              // provider.playerPressedWord(letterText);
              // provider.currentScoreIncrement();
              // provider.getGuessWord();
            },
            child: Text(
              "$letterText",
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
