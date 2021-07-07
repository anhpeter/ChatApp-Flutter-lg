import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{
  var msgController = TextEditingController().obs;

  clear(){
    msgController.value.clear();
  }
}