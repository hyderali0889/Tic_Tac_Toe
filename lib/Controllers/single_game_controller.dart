import 'package:get/get.dart';

class SingleController extends GetxController {
  RxBool userPlaying = false.obs;

  RxList boxes = ["", "", "", "", "", "", "", "", ""].obs;

  changeUserPlaying(bool newUserVal) {
    userPlaying.value = newUserVal;
  }

  addToBox(int mum, bool value) {
    boxes[mum] = value;
  }
}
