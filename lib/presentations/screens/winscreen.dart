import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tictactoeai/presentations/screens/with_ai.dart';

import 'package:tictactoeai/presentations/screens/with_friend.dart';

class WinScreen extends StatefulWidget {
  int winner;
  int winSrc;
  WinScreen({
    Key? key,
    required this.winner,
    required this.winSrc,
  }) : super(key: key);

  @override
  _WinScreenState createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  ConfettiController? controllerTopCenter;

  @override
  void initState() {
    super.initState();
    setState(() {
      initController();
    });
  }

  void initController() {
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    controllerTopCenter?.play();

    Align buildButton() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: RaisedButton(
            onPressed: () {
              if(widget.winSrc==1){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => WithAiScreen()));
              }else{
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => WithFriendScreen()));
              }
              
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.red,
            textColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Play again!",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Align buildConfettiWidget(controller, double blastDirection) {
      return Align(
        alignment: Alignment.topCenter,
        child: ConfettiWidget(
          maximumSize: Size(30, 30),
          shouldLoop: false,
          confettiController: controller,
          blastDirection: blastDirection,
          blastDirectionality: BlastDirectionality.directional,
          maxBlastForce: 20, // set a lower max blast force
          minBlastForce: 8, // set a lower min blast force
          emissionFrequency: 1,
          //minBlastForce: 8, // a lot of particles at once
          gravity: 1,
        ),
      );
    }

    final kInnerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
    );

    final kGradientBoxDecoration = BoxDecoration(
      gradient: LinearGradient(colors: [Colors.black, Colors.redAccent]),
      borderRadius: BorderRadius.circular(18),
    );

    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/winner.png",
                    width: mediaQuery.width * 0.5,
                    height: mediaQuery.height * 0.5,
                  ),
                ],
              ),
            ),
            Positioned(
              top: mediaQuery.height / 8.29655265,
              child: Container(
                width: mediaQuery.width,
                child: Center(
                  child: GradientText(
                    widget.winner == 1 ? "x" : "o",
                    style: GoogleFonts.lacquer(
                        fontSize: 96,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                    colors: widget.winner == 1
                        ? [Color(0xfff81a1a), Color(0xf7c3089a)]
                        : [Color(0xff00d1ff), Color(0xf7b428e5)],
                  ),
                ),
              ),
            ),
            Positioned(
                top: mediaQuery.height / 2.59655265,
                child: Container(
                    width: mediaQuery.width,
                    child: Center(
                      child: GradientText(
                        'Winner',
                        style: GoogleFonts.lacquer(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                        colors: [Color(0xfff81a1a), Color(0xf7c3089a)],
                      ),
                    ))),
            buildButton(),
            buildConfettiWidget(controllerTopCenter, pi / 1),
            buildConfettiWidget(controllerTopCenter, pi / 4),
          ],
        )),
      ),
    );
  }
}
