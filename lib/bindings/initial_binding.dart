import 'package:chat_app/controllers/app_controller.dart';
import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/controllers/realtime_controller.dart';
import 'package:get/get.dart';

class InititleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RealtimeController());
    Get.put(AppController());
    Get.put(AuthController());
  }
}
