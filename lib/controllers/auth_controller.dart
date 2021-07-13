import 'package:chat_app/https/MySocket.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/screens/home/home_screen.dart';
import 'package:chat_app/screens/user_option_screen/user_option_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController intance = Get.find();
  Rx<User?> user = Rx<User>(null as User);
  MySocket mySocket = MySocket.getIntace();

  @override
  void onInit() {
    handleUserChanges();
    super.onInit();
  }

  void handleUserChanges() {
    user.listen((u) {
      if (u == null) {
        Get.offAllNamed(UserOptionScreen.routeNamed);
      } else {
        Get.offAllNamed(HomeScreen.routeNamed);
      }
    });
  }

  void setUser(User? user) {
    this.user.value = user;
  }

  void signInWithUser(User? item) {
    mySocket.signIn(item!);
    setUser(item);
  }

  void signOut() {
    mySocket.signOut(user.value!);
    setUser(null);
  }

  bool get isLogged => user.value != null;
}
