import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tictactoeai/logics/with_friend.dart';
import 'package:tictactoeai/presentations/screens/winscreen.dart';

class WithFriendScreen extends StatefulWidget {
  const WithFriendScreen({Key? key}) : super(key: key);
  @override
  State<WithFriendScreen> createState() => _WithFriendScreenState();
}

class _WithFriendScreenState extends State<WithFriendScreen> {
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

  List<int> data = [];
  int activeMove = 1;
  int prevIndex = 0;
  bool isTie = false;

  @override
  void initState() {
    super.initState();
    data = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    activeMove = 1;
  }

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
                        children: List.generate(
                            9,
                            (index) => InkWell(
                                  onTap: () {
                                    if (data[index] == 0) {
                                      if (activeMove == 1) {
                                        data[index] = 1;
                                        if (WithFrndLogic()
                                                .isWin(activeMove, data) ==
                                            activeMove) {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          WinScreen(
                                                            winner: activeMove,
                                                            winSrc: 2,
                                                          )));
                                        }else if(!data.contains(0)){
                                          setState(() {
                                            isTie = true;
                                          });
                                        } else {
                                          setState(() {
                                            data[index] = 1;
                                            activeMove = 2;
                                            prevIndex = index;
                                          });
                                        }
                                      } else {
                                        data[index] = 2;
                                        if (WithFrndLogic()
                                                .isWin(activeMove, data) ==
                                            activeMove) {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          WinScreen(
                                                            winner: activeMove,
                                                            winSrc: 2,
                                                          )));
                                        } else {
                                          setState(() {
                                            data[index] = 2;
                                            activeMove = 1;
                                            prevIndex = index;
                                          });
                                        }
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: _mediaQuery.width / 4.356166,
                                    height: _mediaQuery.height / 10.356166,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        child: Center(
                                          child: GradientText(
                                            data[index] == 0
                                                ? ""
                                                : data[index] == 1
                                                    ? "x"
                                                    : "o",
                                            style: GoogleFonts.lacquer(
                                                fontSize: 64,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                            colors: data[index] == 0
                                                ? [Colors.white, Colors.white]
                                                : data[index] == 1
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
                                )),
                      ),
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
                      child: isTie
                          ? Text(
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
                            )
                          : Row(
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
                                          activeMove == 0
                                              ? ""
                                              : activeMove == 1
                                                  ? "x"
                                                  : "o",
                                          style: GoogleFonts.lacquer(
                                              fontSize: 64,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                          colors: activeMove == 0
                                              ? [Colors.white, Colors.white]
                                              : activeMove == 1
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
                        if (isTie) {
                          setState(() {
                            data = [0, 0, 0, 0, 0, 0, 0, 0, 0];
                            activeMove = 1;
                            prevIndex = 0;
                            isTie = false;
                          });
                        } else if (data[prevIndex] != 0) {
                          setState(() {
                            data[prevIndex] = 0;
                            activeMove = (activeMove == 1 ? 2 : 1);
                          });
                        }
                      },
                      child: Container(
                        width: _mediaQuery.width / 4.356166,
                        height: _mediaQuery.height / 10.356166,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            child: Center(
                              child: isTie
                                  ? Icon(Icons.restart_alt, size: 28)
                                  : Icon(Icons.replay, size: 28),
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
}
