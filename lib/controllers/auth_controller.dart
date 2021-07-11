import 'package:chat_app/constants/socket_event.dart';
import 'package:chat_app/https/MySocket.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/screens/home/home_screen.dart';
import 'package:chat_app/screens/user_option_screen/user_option_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController intance = Get.find();
  late Rx<User?> user;
  MySocket mySocket = MySocket.getIntace();

  @override
  void onReady() {
    super.onReady();
  }

  void setDefaultScreen() {
    if (user.value == null) {
      Get.offAllNamed(UserOptionScreen.routeNamed);
    } else {
      Get.offAllNamed(HomeScreen.routeNamed);
    }
  }

  void setUser(User? user) {
    this.user = Rx<User?>(user);
    setDefaultScreen();
  }

  void signInWithUser(User? item) {
    mySocket.signIn(item!);
    setUser(item);
  }

  void signOut() {
    mySocket.signOut(user.value!);
    setUser(null);
  }
}
