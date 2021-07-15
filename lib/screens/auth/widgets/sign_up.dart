import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/ui.dart';
import 'package:chat_app/screens/auth/widgets/auth_icon.dart';
import 'package:chat_app/screens/auth/widgets/remember_me.dart';
import 'package:flutter/material.dart';

import 'auth_main_button.dart';
import 'auth_text_field.dart';
import 'auth_title.dart';
import 'message_with_text_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: kDefaultPadding),
        AuthTitle(text: 'Sign Up'),
        SizedBox(height: kDefaultPadding),
        AuthTextField(controller: null, label: 'Email'),
        AuthTextField(controller: null, label: 'Password'),
        SizedBox(height: kDefaultPadding),
        AuthMainButton(
          callback: () {},
          text: 'Sign Up',
        ),
        SizedBox(height: kDefaultPadding),
        MessageWithTextButton(message: 'Already have an Account?',buttonText: 'Sign In', buttonCallback: ()=>authController.switchAuthDisplay(),)
      ],
    );
  }
}
