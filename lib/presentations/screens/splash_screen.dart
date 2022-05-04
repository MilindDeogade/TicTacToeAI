import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tictactoeai/presentations/screens/menu_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _counter = 0;

  final Shader _linearGradient = LinearGradient(
    colors: [Colors.red.shade800, Colors.pink.shade600],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 30.0, 60.0));

  final Shader _linearGradient1 = LinearGradient(
    colors: [Color(0xff00d1ff), Colors.blueAccent.shade700],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 6.0, 7.00));

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const MenuScreen()));
    });
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
              Column(
                children: [
                  Text(
                    "Tic\nTac",
                    style: GoogleFonts.lacquer(
                      fontSize: 128,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "T",
                        style: GoogleFonts.lacquer(
                          fontSize: 128,
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
                          fontSize: 128,
                          fontWeight: FontWeight.w700,
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(4.0, 4.0),
                                blurRadius: 8.0,
                                color: Colors.white38),
                          ],
                        ),
                        colors: [Color(0xfff81a1a), Color(0xf7c3089a)],
                      ),
                      Text(
                        "e",
                        style: GoogleFonts.lacquer(
                          fontSize: 128,
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
                ],
              ),
              GradientText(
                'AI',
                gradientType: GradientType.radial,
                style: GoogleFonts.lacquer(
                  fontSize: 128,
                  fontWeight: FontWeight.w700,
                  
                ),
                colors: [Color(0xff00d1ff), Color(0xf7b428e5)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
