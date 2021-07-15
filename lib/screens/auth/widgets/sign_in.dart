import 'package:chat_app/common/custom_validators.dart';
import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/ui.dart';
import 'package:chat_app/screens/auth/widgets/auth_icon.dart';
import 'package:chat_app/screens/auth/widgets/message_with_text_button.dart';
import 'package:chat_app/screens/auth/widgets/remember_me.dart';
import 'package:flutter/material.dart';

import 'auth_main_button.dart';
import 'auth_text_field.dart';
import 'auth_title.dart';

class SignIn extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding),
          AuthTitle(text: 'Sign In'),
          SizedBox(height: kDefaultPadding),
          AuthTextField(
            controller: authController.emailController,
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value)=> CustomValidators.required(value, "Email"),
          ),
          AuthTextField(
            obscureText: true,
            controller: authController.passwordController,
            label: 'Password',
            validator: (value)=> CustomValidators.required(value, "Password"),
          ),
          buildForgotPasswordButton(),
          RememberMe(true),
          AuthMainButton(
            callback: () {
              var isValid = formKey.currentState!.validate();
              if (isValid) {
                authController.signInWithEmailAndPassword();
              }
            },
            text: 'Login',
          ),
          SizedBox(height: kDefaultPadding),
          buildOrSignInWith(context),
          SizedBox(height: kDefaultPadding),
          buildBrandSignInOptions(),
          SizedBox(height: kDefaultPadding),
          MessageWithTextButton(
            message: 'Do not have an Account?',
            buttonText: 'Sign Up',
            buttonCallback: () => authController.switchAuthDisplay(),
          )
        ],
      ),
    );
  }

  Row buildForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: () {}, child: Text("Forgot password?")),
      ],
    );
  }

  Row buildBrandSignInOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AuthBrandIcon(
          callback: () {},
          iconPath: 'assets/icons/brand_image_icons/facebook.png',
        ),
        AuthBrandIcon(
          callback: () {
            authController.signInWithGoogle();
          },
          iconPath: 'assets/icons/brand_image_icons/google.png',
        ),
      ],
    );
  }

  RichText buildOrSignInWith(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '--OR--\n\n',
        style: Theme.of(context).textTheme.subtitle1,
        children: const <TextSpan>[
          TextSpan(
            text: 'Sign in with',
          ),
        ],
      ),
    );
  }
}
