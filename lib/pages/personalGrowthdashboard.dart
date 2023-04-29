import 'package:companion/pages/customDrawer.dart';
import 'package:companion/widgets/customAppBar.dart';
import 'package:companion/widgets/customBottomAppBar.dart';
import 'package:companion/widgets/customFAB.dart';
import 'package:flutter/material.dart';


class PersonalGrowthDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;


    Widget padding = Padding(
      padding: EdgeInsets.only(bottom: height * .04),
    );

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        title: 'Personal Growth Dashboard',
      ),
      floatingActionButton: CustomFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: CustomBottomAppBar(
        isThisCurrentPage4: true,
      ),

      // BODY

      body: ListView(children: [
        DifferentCard(
          cardHeight: height * .24,
          imgurl: 'assets/imgpgd1.png',
          titleText: Text('Today ToDo'),
          subTitleText: Row(
            children: [Icon(Icons.done), Text('All set')],
          ),
        ),
        
        SizedBox(
          height: height * .1,
        ),
      ]),
    );
  }
}

//////////////////// --------------------------CUSTOM WIDGETS-----------------/////////////////////////////

// This class is used for the text in between the cards

class CommonText extends StatelessWidget {
  final String txt;
  CommonText({this.txt});
  @override
  Widget build(
      BuildContext context,
      ) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final clr = Color.fromRGBO(55, 71, 79, 2);
    return Container(
      alignment: Alignment.centerLeft,
      height: height * .04,
      width: double.infinity,
      padding: EdgeInsets.only(left: width * .03),
      child: Text(
        '$txt',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: height*.025,
          color: clr,
        ),
      ),
    );
  }
}

// This class is used for creating the cards

class CommonCard extends StatelessWidget {
  final String imgurl;
  final String heading;
  final String subheading;
  CommonCard({
    this.heading,
    this.imgurl,
    this.subheading,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(

        alignment: Alignment.center,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            child: ListTile(
              onTap: () {},
              leading: Image.asset('$imgurl',height: height*.1,),
              title: Text('$heading'),
              subtitle: Text('$subheading'),
            )));
  }
}

class IcButton extends StatelessWidget {
  final IconData ic;
  final String txt;

  const IcButton({this.ic, this.txt});
  @override
  Widget build(BuildContext context) {
    final clr = Color.fromRGBO(93, 63, 211, 1);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () {},
      child: Container(
          margin: EdgeInsets.only(left: width*.05, top: height*.01, bottom: height*.02),
          padding: EdgeInsets.symmetric(vertical: height*.025),
          child: Row(
            children: [
              Icon(
                ic,
                size: height*.034,
              ),
              Padding(
                padding: EdgeInsets.only(left: width*.05),
              ),
              Text(
                '$txt',
                style: TextStyle(
                    fontSize: height*.026, fontWeight: FontWeight.w400, color: clr),
              ),
            ],
          )),
    );
  }
}

class DifferentCard extends StatelessWidget {
  final double cardHeight;
  final String imgurl;
  final Widget titleText;
  final Widget subTitleText;

  const DifferentCard({
    Key key,
    this.cardHeight,
    this.imgurl,
    this.titleText,
    this.subTitleText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: cardHeight,
      margin: EdgeInsets.symmetric(horizontal: width*.04, vertical: height*.02),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10)),
        child: Row(
          children: [
            Image.asset(
              imgurl,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              titleText,
              subTitleText,
            ]),
          ],
        ),
      ),
    );
  }
}