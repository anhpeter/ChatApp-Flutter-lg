import 'package:flutter/material.dart';

class StateFullWrapperWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? callback;
  const StateFullWrapperWidget(
      {required this.child, required this.callback, Key? key})
      : super(key: key);

  @override
  _StateFullWrapperWidgetState createState() => _StateFullWrapperWidgetState();
}

class _StateFullWrapperWidgetState extends State<StateFullWrapperWidget> {
  @override
  void initState() {
    // TODO: implement initState
    widget.callback!();
    print("init state");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
