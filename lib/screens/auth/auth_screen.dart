import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/ui.dart';
import 'package:chat_app/screens/auth/widgets/sign_in.dart';
import 'package:chat_app/screens/auth/widgets/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  static const String routeNamed = 'auth';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Obx(() =>
                authController.isDisplaySignIn.value ? SignIn() : SignUp()),
          ),
        ),
      ),
    );
  }
}
