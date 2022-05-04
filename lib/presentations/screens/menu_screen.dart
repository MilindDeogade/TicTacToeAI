import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tictactoeai/presentations/screens/with_ai.dart';
import 'package:tictactoeai/presentations/screens/with_friend.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _counter = 0;

  final Shader _linearGradient = LinearGradient(
    colors: [Colors.red.shade800, Colors.pink.shade600],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 30.0, 60.0));

  final Shader _linearGradient1 = LinearGradient(
    colors: [Color(0xff00d1ff), Colors.blueAccent.shade700],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 6.0, 7.00));

  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(32),
  );

  final kGradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(colors: [Colors.black, Colors.redAccent]),
    borderRadius: BorderRadius.circular(32),
  );

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
                height: _mediaQuery.height / 12.356166,
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
                height: _mediaQuery.height / 6.356166,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const WithAiScreen()));
                },
                child: Container(
                  width: _mediaQuery.width / 1.356166,
                  height: _mediaQuery.height / 16.356166,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      child: Center(
                        child: Text(
                          "Play With AI",
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
                      ),
                      decoration: kInnerDecoration,
                    ),
                  ),
                  decoration: kGradientBoxDecoration,
                ),
              ),
              SizedBox(
                height: _mediaQuery.height / 32.356166,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const WithFriendScreen()));
                },
                child: Container(
                  width: _mediaQuery.width / 1.356166,
                  height: _mediaQuery.height / 16.356166,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      child: Center(
                        child: Text(
                          "With Friends",
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
                      ),
                      decoration: kInnerDecoration,
                    ),
                  ),
                  decoration: kGradientBoxDecoration,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
