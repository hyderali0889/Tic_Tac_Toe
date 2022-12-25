import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Theme/main_colors.dart';

class MainComponents {
  showADialog(context, widget, size) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: size.width * 0.72,
          height: size.height * 0.55,
          child: Stack(
            children: [
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: size.width * 0.7,
                  height: size.height * 0.53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: MainColors.white, width: 3),
                      color: MainColors.darkBlue),
                  child: Padding(
                      padding: const EdgeInsets.all(25.0), child: widget),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.lightTimes,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainButton(size, color, VoidCallback func, icon, title) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 700),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: ((context, value, child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding: EdgeInsets.only(top: value * 15),
            child: TextButton(
                onPressed: func,
                child: Container(
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                      border: Border.all(color: MainColors.darkBlue, width: 3),
                      color: color,
                      borderRadius: BorderRadius.circular(14.0)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: FaIcon(
                              icon,
                              color: MainColors.white,
                            ),
                          ),
                          Text(
                            title,
                            style: TextStyle(
                                color: MainColors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        );
      }),
    );
  }

  Widget upperRowButton(icon, VoidCallback fun) {
    return InkWell(
      onTap: fun,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: MainColors.white, width: 1),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black54),
        child: Center(
          child: FaIcon(
            icon,
            color: MainColors.white,
            size: 17,
          ),
        ),
      ),
    );
  }

  confirmation(context, title, func) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 12,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: MainColors.white, width: 3),
                  borderRadius: BorderRadius.circular(14),
                  color: MainColors.darkBlue),
              width: 400,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Text("Confirm Action",
                          style: TextStyle(
                              color: MainColors.white,
                              fontSize: 20,
                              fontFamily: "Bold")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Text(title,
                        style: TextStyle(
                          color: MainColors.white,
                          fontSize: 15,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: func,
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.green.shade400,
                                borderRadius: BorderRadius.circular(14.0)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: MainColors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          )),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                borderRadius: BorderRadius.circular(14.0)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      color: MainColors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget achContainer(size, userData, color1, color2, title, subtitle) {
    return Container(
        width: size.width * 0.1,
        height: size.height * 0.18,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          border: Border.all(color: MainColors.white, width: 0.5),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(title,
                  style: TextStyle(
                    color: MainColors.white,
                    fontSize: 15,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(subtitle,
                      style: TextStyle(
                        color: MainColors.white,
                        fontSize: 15,
                      )),
                  Text(userData,
                      style: TextStyle(
                        color: MainColors.white,
                        fontSize: 15,
                      )),
                ],
              ),
            ),
          ],
        ));
  }

  showAchDialog(context, widget, size) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.84,
          child: Stack(
            children: [
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: size.width * 0.78,
                  height: size.height * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: MainColors.white, width: 3),
                      color: MainColors.darkBlue),
                  child: Padding(
                      padding: const EdgeInsets.all(25.0), child: widget),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.lightTimes,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
