import 'package:chat_app/controllers/chat_controller.dart';
import 'package:chat_app/controllers/chat_list_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ChatListController());
  }
}