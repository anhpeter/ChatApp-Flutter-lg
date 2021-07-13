import 'package:chat_app/controllers/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterScreen extends StatelessWidget {
  static const routeNamed = 'counter';
  CounterScreen({Key? key}) : super(key: key);
  final CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return _counterController.notInit.value == false
              ? Text("Count: ${_counterController.counter!.value}")
              : Text("Not init yet");
        }),
        ElevatedButton(
            onPressed: () => _counterController.initCounter(),
            child: Text("init counter")),
        ElevatedButton(
            onPressed: () => _counterController.increase(),
            child: Text("Increase")),
      ],
    );
  }
}
