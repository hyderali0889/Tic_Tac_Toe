import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_tak_toe/Components/nothing_widget.dart';
import 'package:tik_tak_toe/Controllers/single_game_controller.dart';

import '../../Theme/main_colors.dart';

class SinglePlayer extends StatefulWidget {
  final String selectedSymbol;
  const SinglePlayer({super.key, required this.selectedSymbol});

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  @override
  void initState() {
    super.initState();
    bool userPlaying = widget.selectedSymbol == "O" ? true : false;
    Get.put(SingleController());
    Get.find<SingleController>().changeUserPlaying(userPlaying);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SingleController controller = Get.find<SingleController>();

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
                        "${controller.userPlaying}'s Turn",
                        style: TextStyle(color: MainColors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              /*
                              888888 88 88""Yb .dP"Y8 888888     88""Yb  dP"Yb  Yb        dP
                              88__   88 88__dP `Ybo."   88       88__dP dP   Yb  Yb  db  dP
                              88""   88 88"Yb  o.`Y8b   88       88"Yb  Yb   dP   YbdPYbdP
                              88     88 88  Yb 8bodP'   88       88  Yb  YbodP     YP  YP
                              */
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                                right: BorderSide(
                                                    color: Colors.black,
                                                    width: 2))),
                                        child:
                                            Image.asset('assets/imgs/X.png')),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                                right: BorderSide(
                                                    color: Colors.black,
                                                    width: 2))),
                                        child:
                                            Image.asset('assets/imgs/X.png')),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: const BoxDecoration(
                                            border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black, width: 2),
                                        )),
                                        child:
                                            Image.asset('assets/imgs/X.png')),
                                  ),
                                ],
                              ),

                              /*
                              .dP"Y8 888888  dP""b8  dP"Yb  88b 88 8888b.      88""Yb  dP"Yb  Yb        dP
                              `Ybo." 88__   dP   `" dP   Yb 88Yb88  8I  Yb     88__dP dP   Yb  Yb  db  dP
                              o.`Y8b 88""   Yb      Yb   dP 88 Y88  8I  dY     88"Yb  Yb   dP   YbdPYbdP
                              8bodP' 888888  YboodP  YbodP  88  Y8 8888Y"      88  Yb  YbodP     YP  YP
                              */
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                                right: BorderSide(
                                                    color: Colors.black,
                                                    width: 2))),
                                        child:
                                            Image.asset('assets/imgs/X.png')),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                                right: BorderSide(
                                                    color: Colors.black,
                                                    width: 2))),
                                        child:
                                            Image.asset('assets/imgs/X.png')),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: const BoxDecoration(
                                            border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black, width: 2),
                                        )),
                                        child:
                                            Image.asset('assets/imgs/X.png')),
                                  ),
                                ],
                              ),

                              /*
                              888888 88  88 88 88""Yb 8888b.      88""Yb  dP"Yb  Yb        dP
                                88   88  88 88 88__dP  8I  Yb     88__dP dP   Yb  Yb  db  dP
                                88   888888 88 88"Yb   8I  dY     88"Yb  Yb   dP   YbdPYbdP
                                88   88  88 88 88  Yb 8888Y"      88  Yb  YbodP     YP  YP
                              */
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black,
                                                    width: 2))),
                                        child:
                                            Image.asset('assets/imgs/X.png')),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.black,
                                                    width: 2))),
                                        child:
                                            Image.asset('assets/imgs/X.png')),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: SizedBox(
                                        width: 120,
                                        height: 120,
                                        child:
                                            Image.asset('assets/imgs/X.png')),
                                  ),
                                ],
                              ),
                            ],
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
