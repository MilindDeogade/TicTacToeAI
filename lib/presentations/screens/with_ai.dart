import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tictactoeai/logics/with_friend.dart';
import 'package:tictactoeai/presentations/screens/winscreen.dart';

import 'ai.dart';

class WithAiScreen extends StatefulWidget {
  const WithAiScreen({Key? key}) : super(key: key);
  @override
  State<WithAiScreen> createState() => _WithAiScreenState();
}

class _WithAiScreenState extends State<WithAiScreen> {
  final Shader _linearGradient = LinearGradient(
    colors: [Colors.red.shade800, Colors.pink.shade600],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 30.0, 60.0));

  final Shader _linearGradient1 = LinearGradient(
    colors: [Color(0xff00d1ff), Colors.blueAccent.shade700],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 6.0, 7.00));

  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
  );

  final kGradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(colors: [Colors.black, Colors.redAccent]),
    borderRadius: BorderRadius.circular(18),
  );

  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  var ai = 'X';
  var human = 'O';
  var currentPlayer = 'O';

  @override
  void initState() {
    super.initState();
    currentPlayer = human;
    bestMove();
  }

  equals3(a, b, c) {
    return a == b && b == c && a != '';
  }

  checkWinner() {
    var winner = null;

    // horizontal
    for (var i = 0; i < 3; i++) {
      if (equals3(board[i][0], board[i][1], board[i][2])) {
        winner = board[i][0];
      }
    }

    // Vertical
    for (var i = 0; i < 3; i++) {
      if (equals3(board[0][i], board[1][i], board[2][i])) {
        winner = board[0][i];
      }
    }

    // Diagonal
    if (equals3(board[0][0], board[1][1], board[2][2])) {
      winner = board[0][0];
    }
    if (equals3(board[2][0], board[1][1], board[0][2])) {
      winner = board[2][0];
    }

    var openSpots = 0;
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          openSpots++;
        }
      }
    }

    if (winner == null && openSpots == 0) {
      return 'tie';
    } else {
      return winner;
    }
  }

  mousePressed(int i, int j) {
    if (currentPlayer == human) {
      // If valid turn
      if (board[i][j] == '') {
        board[i][j] = human;
        currentPlayer = ai;
        bestMove();
      }
    }
  }

  bool isTie=false;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: _mediaQuery.width,
        height: _mediaQuery.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38.50),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: [Color(0x3d5e5e5f), Color(0xbf222222)],
            )),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: _mediaQuery.height / 24.356166,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tic Tac T",
                    style: GoogleFonts.lacquer(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                            offset: Offset(4.0, 4.0),
                            blurRadius: 8.0,
                            color: Colors.white38),
                      ],
                    ),
                  ),
                  GradientText(
                    'o',
                    style: GoogleFonts.lacquer(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: [Color(0xfff81a1a), Color(0xf7c3089a)],
                  ),
                  Text(
                    "e",
                    style: GoogleFonts.lacquer(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                            offset: Offset(4.0, 4.0),
                            blurRadius: 8.0,
                            color: Colors.white38),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: _mediaQuery.height / 24.356166,
              ),
              Container(
                width: _mediaQuery.width / 1.156166,
                height: _mediaQuery.height / 2.656166,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    child: Center(
                      child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (var i = 0; i < 3; i++)
                              for (var j = 0; j < 3; j++)
                                InkWell(
                                  onTap: () {
                                    mousePressed(i, j);
                                  },
                                  child: Container(
                                    width: _mediaQuery.width / 4.356166,
                                    height: _mediaQuery.height / 10.356166,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        child: Center(
                                          child: GradientText(
                                            board[i][j],
                                            style: GoogleFonts.lacquer(
                                                fontSize: 64,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                            colors: board[i][j] == ""
                                                ? [Colors.white, Colors.white]
                                                : board[i][j] == "X"
                                                    ? [
                                                        Color(0xfff81a1a),
                                                        Color(0xf7c3089a)
                                                      ]
                                                    : [
                                                        Color(0xff00d1ff),
                                                        Color(0xf7b428e5)
                                                      ],
                                          ),
                                        ),
                                        decoration: kInnerDecoration,
                                      ),
                                    ),
                                    decoration: kGradientBoxDecoration,
                                  ),
                                ),
                          ]),
                    ),
                    decoration: kInnerDecoration,
                  ),
                ),
                decoration: kGradientBoxDecoration,
              ),
              SizedBox(
                height: _mediaQuery.height / 32.356166,
              ),
              Container(
                width: _mediaQuery.width / 1.856166,
                height: _mediaQuery.height / 9.056166,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    child: Center(
                      child: isTie? Text(
                            " Tie ",
                            style: GoogleFonts.lacquer(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              shadows: <Shadow>[
                                Shadow(
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 8.0,
                                    color: Colors.white38),
                              ],
                            ),
                          ) :Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            " Move :",
                            style: GoogleFonts.lacquer(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              shadows: <Shadow>[
                                Shadow(
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 8.0,
                                    color: Colors.white38),
                              ],
                            ),
                          ),
                          Container(
                            width: _mediaQuery.width / 4.356166,
                            height: _mediaQuery.height / 10.356166,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                child: Center(
                                  child: GradientText(
                                    currentPlayer,
                                    style: GoogleFonts.lacquer(
                                        fontSize: 64,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                    colors: currentPlayer == ""
                                        ? [Colors.white, Colors.white]
                                        : currentPlayer == "X"
                                            ? [
                                                Color(0xfff81a1a),
                                                Color(0xf7c3089a)
                                              ]
                                            : [
                                                Color(0xff00d1ff),
                                                Color(0xf7b428e5)
                                              ],
                                  ),
                                ),
                                decoration: kInnerDecoration,
                              ),
                            ),
                            decoration: kGradientBoxDecoration,
                          )
                        ],
                      ),
                    ),
                    decoration: kInnerDecoration,
                  ),
                ),
                decoration: kGradientBoxDecoration,
              ),
              SizedBox(
                height: _mediaQuery.height / 18.356166,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: _mediaQuery.width / 4.356166,
                        height: _mediaQuery.height / 10.356166,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            child:
                                Center(child: Icon(Icons.arrow_back, size: 28)),
                            decoration: kInnerDecoration,
                          ),
                        ),
                        decoration: kGradientBoxDecoration,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          board = [
                            ['', '', ''],
                            ['', '', ''],
                            ['', '', '']
                          ];

                          ai = 'X';
                          human = 'O';
                          currentPlayer = 'O';
                          isTie = false;
                        });
                        bestMove();
                      },
                      child: Container(
                        width: _mediaQuery.width / 4.356166,
                        height: _mediaQuery.height / 10.356166,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            child: Center(
                              child: Icon(Icons.restart_alt, size: 28),
                            ),
                            decoration: kInnerDecoration,
                          ),
                        ),
                        decoration: kGradientBoxDecoration,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bestMove() {
    // AI to make its turn
    var bestScore = -(1 / 0);
    var move;
    int bestX = 0;
    int besty = 0;
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        // Is the spot available?
        if (board[i][j] == '') {
          board[i][j] = ai;
          var score = minimax(board, 0, false);
          board[i][j] = '';
          if (score > bestScore) {
            bestScore = score;
            move = {i, j};
            bestX = i;
            besty = j;
          }
        }
      }
    }
    setState(() {
      board[bestX][besty] = ai;
      currentPlayer = human;
    });
    var result = checkWinner();
    if(result!=null){
      if(result=="tie"){
        setState(() {
          isTie = true;
        });
      }else{
        Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          WinScreen(
                                                            winner: result=="X"?1:2, winSrc: 1,
                                                          )));
      }
    }
  }

  var scores = {"X": 10.0, "O": -10.0, "tie": 0.0};

  minimax(board, depth, isMaximizing) {
    var result = checkWinner();
    if (result != null) {
      return scores[result];
    }

    if (isMaximizing) {
      var bestScore = -(1.0 / 0.0);
      for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
          // Is the spot available?
          if (board[i][j] == '') {
            board[i][j] = ai;
            var score = minimax(board, depth + 1, false);
            board[i][j] = '';
            bestScore = max(score, bestScore);
          }
        }
      }
      return bestScore;
    } else {
      var bestScore = (1.0 / 0.0);
      for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
          // Is the spot available?
          if (board[i][j] == '') {
            board[i][j] = human;
            var score = minimax(board, depth + 1, true);
            board[i][j] = '';
            double minVal = min(score, bestScore);
            bestScore = minVal;
          }
        }
      }
      return bestScore;
    }
  }
}
