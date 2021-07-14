import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helper {
  static void showSnackbar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }

  static toDateTime(value) {
    return value != null ? DateTime.fromMillisecondsSinceEpoch(value) : null;
  }

  static String toDividerTimeFormat(DateTime time) {
    String result = "";
    DateTime now = DateTime.now();
    DateFormat? f;
    // this year
    if (time.year == now.year) {
      // yester day to today in this month
      if (time.month == now.month &&
          time.isAfter(now.subtract(Duration(days: 1)))) {
        // doday
        if (time.day == now.day) {
          result = "Today";
          // yesterday
        } else {
          result = "Yesterday";
        }
        //
      } else {
        f = DateFormat('dd/MM');
      }
    } else {
      // another yar
      f = DateFormat('dd/MM/yyyy');
    }
    return result + " ${f != null ? f.format(time) : ""}";
  }

  static String toActiveTimeFormat(DateTime time) {
    String result = "";
    DateTime now = DateTime.now();
    DateFormat? f;
    // this year
    if (time.year == now.year) {
      // yester day to today in this month
      if (time.month == now.month &&
          time.isAfter(now.subtract(Duration(days: 1)))) {
        // doday
        if (time.day == now.day) {
          f = DateFormat('hh:mm');
          // yesterday
        } else {
          result = "Yesterday";
          f = DateFormat('hh:mm');
        }
        //
      } else {
        f = DateFormat('dd/MM hh:mm');
      }
    } else {
      // another yar
      f = DateFormat('dd/MM/yyyy hh:mm');
    }
    return result + " ${f.format(time)}";
  }

  static String toActiveTimeString(DateTime time) {
    String result;
    if (time.isAfter(DateTime.now().subtract(Duration(minutes: 5))))
      result = "recently";
    else
      result = toActiveTimeFormat(time);
    return "Last seen $result";
  }
}
