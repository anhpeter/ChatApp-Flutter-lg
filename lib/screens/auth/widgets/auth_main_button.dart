import 'package:flutter/material.dart';

class AuthMainButton extends StatelessWidget {
  final String text;
  final VoidCallback? callback;
  const AuthMainButton({
    Key? key,
    required this.text,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white)),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
      ),
    );
  }
}
