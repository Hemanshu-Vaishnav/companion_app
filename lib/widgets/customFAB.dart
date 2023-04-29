import 'package:companion/widgets/bottomSheet.dart';
import 'package:companion/widgets/smallBottomsheet.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Color.fromRGBO(93, 63, 211, 1),
        splashColor: Color.fromRGBO(93, 63, 211, 1),
        mini: true,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Bottomsheet();
            },
          );
        });
  }
}

// showModalBottomSheet(
// context: context,
// builder: (context) {
//   return SmallBottomSheet();
// });