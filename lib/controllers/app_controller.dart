import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController{
  static AppController intance = Get.find();
  var themeMode = ThemeMode.system.obs;

  toggleTheme(){
    if (themeMode.value == ThemeMode.light) themeMode.value = ThemeMode.dark;
    else themeMode.value = ThemeMode.light;
  }
}