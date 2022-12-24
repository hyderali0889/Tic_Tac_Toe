import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tik_tak_toe/Screens/sign_selection.dart';
import 'package:tik_tak_toe/Theme/main_colors.dart';

import '../Components/main_components.dart';
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
  TextEditingController nameController = TextEditingController();

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
                    height: size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainComponents().upperRowButton(
                                  FontAwesomeIcons.lightCog, () {
                                MainComponents().showADialog(
                                    context,
                                    settings(size, context, nameController,
                                        userData),
                                    size);
                              }),
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: MainComponents().upperRowButton(
                                          FontAwesomeIcons.lightChartBar,
                                          () {})),
                                  MainComponents().upperRowButton(
                                      FontAwesomeIcons.lightShield, () {
                                    MainComponents().showADialog(
                                        context, achievments(userData), size);
                                  })
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Welcome \n ${userData.get(1)!.name.toUpperCase()}",
                              style: TextStyle(
                                  color: MainColors.white,
                                  fontSize: 32,
                                  fontFamily: 'Bold'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainComponents().mainButton(size, Colors.red.shade600,
                            () {
                          Get.offAll(
                              () => const SignSelection(singleGame: true));
                        }, FontAwesomeIcons.lightGamepad, "Single Player Game"),
                        MainComponents().mainButton(size, Colors.green.shade600,
                            () {
                          Get.offAll(
                              () => const SignSelection(singleGame: false));
                        }, FontAwesomeIcons.lightGameBoard,
                            "Multi Player Game"),
                        MainComponents().mainButton(
                            size,
                            Colors.blue.shade600,
                            () {},
                            FontAwesomeIcons.lightChartBar,
                            "Statistics"),
                        MainComponents().mainButton(
                            size,
                            Colors.purple.shade600,
                            () {},
                            FontAwesomeIcons.lightWalking,
                            "About")
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

  Widget settings(size, context, nameController, userData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Settings",
              style: TextStyle(
                  color: MainColors.white, fontSize: 20, fontFamily: "Bold")),
        )),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MainComponents().mainButton(size, Colors.brown.shade600, () {
                Get.back();
                MainComponents().showADialog(
                    context, updateName(size, nameController, userData), size);
              }, FontAwesomeIcons.lightSignature, "Update Name"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child:
                    MainComponents().mainButton(size, Colors.grey.shade600, () {
                  MainComponents().confirmation(
                      context, "Are you sure you wanna reset the Stats", () {
                    User userDetails = User(
                        id: 1,
                        name: userData.get(1).name,
                        gamesPlayedvsComputer: 0,
                        gamesPlayedvsPlayer: 0,
                        gamesWonvsComputer: 0,
                        gamesWonvsPlayer: 0,
                        consectiveWins: 0);

                    userData.put(userDetails);
                    Get.back();
                    Get.back();
                  });
                }, FontAwesomeIcons.lightBracketsCurly, "Reset Statstics"),
              ),
              MainComponents().mainButton(size, Colors.purple.shade600, () {},
                  FontAwesomeIcons.lightWreath, "Credits"),
            ],
          ),
        ),
      ],
    );
  }

  Widget updateName(size, nameController, userData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Update Name",
              style: TextStyle(
                  color: MainColors.white, fontSize: 20, fontFamily: "Bold")),
        )),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (val) {
                  if (nameController.text.isEmpty) {
                    return;
                  }
                  User userDetails = User(
                      id: 1,
                      name: val.trim(),
                      gamesPlayedvsComputer: 0,
                      gamesPlayedvsPlayer: 0,
                      gamesWonvsComputer: 0,
                      gamesWonvsPlayer: 0,
                      consectiveWins: 0);
                  userData.put(userDetails);
                  Get.offAll(() => const GameSelection());
                },
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Please Enter Name",
                  hintStyle: const TextStyle(
                    color: Colors.white54,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2)),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child:
                    MainComponents().mainButton(size, Colors.red.shade600, () {
                  if (nameController.text.isEmpty) {
                    return;
                  }

                  User userDetails = User(
                      id: 1,
                      name: nameController.text.trim(),
                      gamesPlayedvsComputer: 0,
                      gamesPlayedvsPlayer: 0,
                      gamesWonvsComputer: 0,
                      gamesWonvsPlayer: 0,
                      consectiveWins: 0);
                  userData.put(userDetails);
                  Get.offAll(() => const GameSelection());
                }, FontAwesomeIcons.lightSignature, "Update Name"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget achievments(userData) {
    return ListView(
      children: [Text("${userData.get(1).name}")],
    );
  }
}
