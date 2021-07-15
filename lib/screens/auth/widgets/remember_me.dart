import 'package:flutter/material.dart';

class RememberMe extends StatelessWidget {
  final bool value;
  const RememberMe(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      value: value,
      onChanged: (bool) {},
      title: Text("Remember me?"),
      controlAffinity: ListTileControlAffinity.leading,
    );
    ;
  }
}
