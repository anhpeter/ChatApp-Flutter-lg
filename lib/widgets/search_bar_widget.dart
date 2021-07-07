import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchBarWidgetState();
  }
}

class _SearchBarWidgetState extends State {
  var searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryTextTheme.subtitle1!.color;
    var textStyle =
        TextStyle(color: color);
    return TextField(
      controller: searchController,
      style: textStyle,
      autofocus: true,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintStyle: textStyle,
        hintText: "Search...",
        border: InputBorder.none,
        suffixIcon: searchController.text != ""
            ? IconButton(onPressed: () {
              searchController.clear();
            }, icon: Icon(Icons.clear, color: color,))
            : null,
      ),
    );
  }
}
