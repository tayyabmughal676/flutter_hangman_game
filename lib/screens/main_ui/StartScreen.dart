
import 'package:flutter/material.dart';
import 'package:hangman_flutter/screens/main_ui/GameScreen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  var customColor = "#391d96";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Column(
          children: [
           Image(image: AssetImage("assets/images/gallow.png")),
            Text("Hangman", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
              color: Colors.white,
              fontFamily: "RaleWay"
            ),),
            SizedBox(height: 60.0,),

            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen())
                );
              },
              child: Container(
                height: 50.0,
                width: 180.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color.fromRGBO(59, 29, 150, 1.0)
                ),
                child: Center(
                  child: Text("Let's Start", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
