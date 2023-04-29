import 'package:companion/pages/companionApp.dart';

import 'package:companion/pages/personalGrowthdashboard.dart';

import 'package:companion/widgets/bottomBarButton.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final bool isThisCurrentPage1;
  final bool isThisCurrentPage2;
  final bool isThisCurrentPage3;
  final bool isThisCurrentPage4;
  final bool isThisDrawer;

  const CustomBottomAppBar({
    Key key,
    this.isThisCurrentPage1 = false,
    this.isThisCurrentPage2 = false,
    this.isThisCurrentPage3 = false,
    this.isThisCurrentPage4 = false,
    this.isThisDrawer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 1.0,
      elevation: 0,
      color: Color.fromRGBO(93, 63, 211, 1),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * .81,
              height: height * .09,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    //DRAWER BUTTON

                    BottomBarButton(
                      icon: Icons.format_list_bulleted_sharp,
                      onPressed: (){
                        Scaffold.of(context).openDrawer();
                      },
                      highlightCircle: isThisDrawer,
                    ),

                    //GRID BUTTON

                    BottomBarButton(
                      icon: Icons.apps,
                      highlightCircle: isThisCurrentPage1,
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => GoodApp(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                    ),

                    //MOOD BUTTON



                    //PLANT BUTTON



                    //GRAPH BUTTON

                    BottomBarButton(
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => PersonalGrowthDashboard(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                      icon: Icons.donut_small_rounded,
                      highlightCircle: isThisCurrentPage4,
                    ),
                  ]),
            ),
          ]),
    );
  }
}