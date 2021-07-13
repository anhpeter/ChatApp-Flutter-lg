import 'package:get/get.dart';

class CounterController extends GetxController {
  Rx<int>? counter;
  Rx<bool> notInit = true.obs;

  void initCounter() {
    counter = Rx<int>(0);
    notInit.value = false;
  }

  void increase() {
    counter!.value += 1;
  }
}
