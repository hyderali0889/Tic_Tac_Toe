import 'package:flutter/material.dart';
import 'package:tik_tak_toe/Screens/Games/single_player.dart';

import '../Theme/main_colors.dart';

class SignSelection extends StatelessWidget {
  final bool singleGame;

  const SignSelection({super.key, required this.singleGame});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [MainColors.lightBlue, MainColors.darkBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  left: -150,
                  top: 40,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      'assets/imgs/back1.png',
                      width: 350,
                      height: 350,
                    ),
                  )),
              Positioned(
                  right: -150,
                  top: 150,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      'assets/imgs/back2.png',
                      width: 350,
                      height: 350,
                    ),
                  )),
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.4,
                    child: Center(
                      child: Text(
                        "Select Your Symbol",
                        style: TextStyle(
                            color: MainColors.white,
                            fontSize: 32,
                            fontFamily: 'Bold'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const SinglePlayer(
                                                  selectedSymbol: "X"))),
                                      (route) => false);
                                },
                                child: Container(
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(14.0)),
                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset(
                                          'assets/imgs/X.png',
                                          height: 150,
                                          width: 150,
                                        )),
                                  ),
                                )),
                                 TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const SinglePlayer(
                                                  selectedSymbol: "O"))),
                                      (route) => false);
                                },
                                child: Container(
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(14.0)),
                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset(
                                          'assets/imgs/O.png',
                                          height: 150,
                                          width: 150,
                                        )),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
