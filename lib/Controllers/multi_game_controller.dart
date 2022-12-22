import 'package:get/get.dart';

class MultiController extends GetxController {
  RxBool userPlaying = false.obs;
  RxBool isGameCompleted = false.obs;

  RxList boxes = ["", "", "", "", "", "", "", "", ""].obs;

  changeUserPlaying(bool newUserVal) {
    userPlaying.value = newUserVal;
  }

  addToBox(int mum, String value) {
    boxes[mum] = value;
    checkIfGameFinished();
  }

  finishGame() {
    isGameCompleted.value = true;
  }

  checkIfGameFinished() {




    if (boxes[0] != "" &&
        boxes[1] != "" &&
        boxes[2] != "" &&
        boxes[3] != "" &&
        boxes[4] != "" &&
        boxes[5] != "" &&
        boxes[6] != "" &&
        boxes[7] != "" &&
        boxes[8] != "") {
      finishGame();
    }
  }
}
