import 'package:flutter/material.dart';
import 'package:tik_tak_toe/Components/background.dart';
import 'package:tik_tak_toe/Screens/sign_selection.dart';
import 'package:tik_tak_toe/Theme/main_colors.dart';

import '../Models/users.dart';
import '../main.dart';
import '../objectbox.g.dart';

class GameSelection extends StatefulWidget {
  const GameSelection({super.key});

  @override
  State<GameSelection> createState() => _GameSelectionState();
}

class _GameSelectionState extends State<GameSelection> {
  Box<User> userData = objectBox.store.box<User>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MainColors.lightBlue,
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
                        "Welcome \n ${userData.get(userData.count())!.name.toUpperCase()}",
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
                        Padding(
                          padding: const EdgeInsets.symmetric( vertical:10.0),
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                 MaterialPageRoute(builder: (context) => const SignSelection(singleGame: true) )  ,
                                    (route) => false);
                              },
                              child: Container(
                                width: size.width * 0.7,
                                decoration: BoxDecoration(
                                    color: Colors.red.shade600,
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Single Player Game",
                                      style: TextStyle(
                                          color: MainColors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        TextButton(
                            onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                               MaterialPageRoute(builder: (context) => const SignSelection(singleGame: false) )  ,
                                  (route) => false);
                             },
                            child: Container(
                              width: size.width * 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade600,
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    "Multi Player Game",
                                    style: TextStyle(
                                        color: MainColors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only( top :10.0),
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                width: size.width * 0.7,
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade600,
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Statistics",
                                      style: TextStyle(
                                          color: MainColors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                              )),
                        )
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
