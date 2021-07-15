import 'package:chat_app/common/custom_validators.dart';
import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/ui.dart';
import 'package:flutter/material.dart';

import 'auth_main_button.dart';
import 'auth_text_field.dart';
import 'auth_title.dart';
import 'message_with_text_button.dart';

class SignUp extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding),
          AuthTitle(text: 'Sign Up'),
          SizedBox(height: kDefaultPadding),
          AuthTextField(
            controller: authController.usernameController,
            keyboardType: TextInputType.text,
            label: 'Username',
            validator: (value) => CustomValidators.mulValidator(
              [
                () => CustomValidators.required(value, "Username"),
                () => CustomValidators.length(value, "Username", 2),
              ],
            ),
          ),
          AuthTextField(
            controller: authController.emailController,
            label: 'Email',
            validator: (value) => CustomValidators.mulValidator(
              [
                () => CustomValidators.required(value, "Email"),
                () => CustomValidators.email(value, "Email")
              ],
            ),
          ),
          AuthTextField(
            controller: authController.passwordController,
            obscureText: true,
            label: 'Password',
            validator: (value) => CustomValidators.mulValidator(
              [
                () => CustomValidators.required(value, "Password"),
                () => CustomValidators.password(value, "Password")
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding),
          AuthMainButton(
            callback: () {
              var isValid = formKey.currentState!.validate();
              if (isValid) {
                authController.signUpWithEmailAndPassword();
              }
            },
            text: 'Sign Up',
          ),
          SizedBox(height: kDefaultPadding),
          MessageWithTextButton(
            message: 'Already have an Account?',
            buttonText: 'Sign In',
            buttonCallback: () => authController.switchAuthDisplay(),
          )
        ],
      ),
    );
  }
}
