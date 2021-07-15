import 'package:chat_app/common/Helper.dart';
import 'package:chat_app/common/custom_validators.dart';
import 'package:chat_app/https/MyHttp.dart';
import 'package:chat_app/https/MySocket.dart';
import 'package:chat_app/models/user.dart' as MyUser;
import 'package:chat_app/screens/auth/auth_screen.dart';
import 'package:chat_app/screens/auth/widgets/auth_text_field.dart';
import 'package:chat_app/screens/auth/widgets/firebase.dart';
import 'package:chat_app/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController intance = Get.find();
  MySocket mySocket = MySocket.getIntace();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // obs
  Rx<MyUser.User?> user = Rx<MyUser.User>(null as MyUser.User);
  Rx<User?> firebaseUser = Rx<User>(null as User);
  Rx<bool> isDisplaySignIn = true.obs;

  @override
  void onInit() {
    firebaseUser.bindStream(auth.userChanges());
    //ever(firebaseUser, setDefaultScreen);
    user.listen(setDefaultScreen);
    super.onInit();
  }

  // set screen when user changes
  void setDefaultScreen(MyUser.User? u) {
    clearInputs();
    if (u != null)
      Get.offAllNamed(HomeScreen.routeNamed);
    else
      Get.offAllNamed(AuthScreen.routeNamed);
  }

  void setUser(MyUser.User? user) {
    this.user.value = user;
  }

  // auth methods
  void signInWithUser(MyUser.User? item) {
    mySocket.signIn(item!);
    setUser(item);
  }

  void signInWithEmailAndPassword() {
    final email = emailController.text;
    final password = Helper.generateMd5(passwordController.text);
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential userCredential) {
      MyHttp.fetchUserByUid(userCredential.user!.uid).then((MyUser.User user) {
        Get.snackbar("Notification", "Sign in successfully!");
        setUser(user);
      });
    }).catchError((err) {
      Get.snackbar("Notification", "failed to sign in!");
    });
  }

  void signUpWithEmailAndPassword() {
    auth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((UserCredential userCredential) {
      var uid = userCredential.user!.uid;
      Map<String, String> json = {
        'email': userCredential.user!.email!,
        'username': usernameController.text,
        'password': passwordController.text,
        'uid': userCredential.user!.uid,
      };
      MyHttp.createUser(json).then((_) {
        Get.snackbar("Notification", "Sign up successfully!");
        clearInputs();
        switchAuthDisplay();
      });
    }).catchError((err) {
      Get.snackbar("Notification", "Failed to sign up!");
    });
  }

  void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    try {
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      MyHttp.getOrCreateUserIfNotExist({
        'username': Helper.getUsernameFromEmail(userCredential.user!.email!),
        'email': userCredential.user!.email!,
        'avatar_url': userCredential.user!.photoURL,
        'fullname': userCredential.user!.displayName
      }).then((user) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          //Get.defaultDialog(
            //title: "Enter username",
            //middleText: "Hello world!",
            //textConfirm: "Confirm",
            //textCancel: "Cancel",
            //content: Column(
              //children: [
                //AuthTextField(
                  //controller: usernameController,
                  //keyboardType: TextInputType.text,
                  //label: 'Username',
                  //validator: (value) => CustomValidators.mulValidator(
                    //[
                      //() => CustomValidators.required(value, "Username"),
                      //() => CustomValidators.length(value, "Username", 2),
                    //],
                  //),
                //),
              //],
            //),
          //);
        }
        Get.snackbar("Notification", "Sign in successfully!");
        setUser(user);
      });
    } catch (e) {
      throw e;
    }
  }

  void signOut() {
    mySocket.signOut(user.value!);
    setUser(null);
    auth.signOut();
  }

  // handle ui
  void switchAuthDisplay() {
    clearInputs();
    isDisplaySignIn.value = !isDisplaySignIn.value;
  }

  // support
  void clearInputs() {
    emailController.clear();
    passwordController.clear();
    usernameController.clear();
  }

  bool get isLogged => user.value != null;

  void deleteAllAccount() {}
}
