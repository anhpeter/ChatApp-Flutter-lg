import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  const AuthTextField({
    Key? key,
    required this.label,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
