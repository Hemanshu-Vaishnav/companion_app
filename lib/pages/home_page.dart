import 'package:flutter/material.dart';
import 'package:companion/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Codepur";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Companion app :)"),
      ),
      body: Center(
        child: Container(
          child: Text(" take 3 deep breaths and just relax <3"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}