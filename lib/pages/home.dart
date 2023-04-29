import 'package:companion/home/background.dart';
import 'package:companion/pages/customDrawer.dart';
import 'package:companion/widgets/customBottomAppBar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final color = Color.fromRGBO(55, 71, 79, 2);


    return Scaffold(
        drawer: CustomDrawer(),
        body: Stack(
          children: [
            Background(),
            Positioned(
              left: width / 3.7,
              bottom: height / 95,
              child: Column(
                children: [
                  SizedBox(
                      width: width * .25,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: ((8 / height) * height)),
                        child: Text('Select a category from below',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: color,
                              fontSize: height * .0166,
                              fontWeight: FontWeight.w500,
                            )),
                      )),
                  Image.asset(
                    'assets/imgdownArrow.png',
                    width: width * .2,
                    height: height * .1,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar:CustomBottomAppBar()
    );
  }
}