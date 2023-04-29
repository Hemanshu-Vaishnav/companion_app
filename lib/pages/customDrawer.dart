import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Drawer(
        child: ListView(padding: EdgeInsets.all(15),
            children: [SizedBox( width: double.infinity,



            ),
              DrawerItems(
                icon: Icons.account_circle_rounded,
                title: 'Login',
              ),
              DrawerItems(
                icon: Icons.flare ,
                title: 'Morning Booster',
              ),

              DrawerItems(
                icon: Icons.sentiment_satisfied_alt_outlined,
                title: 'Good break of the day',
              ),

              DrawerItems(
                icon: Icons.call,
                title: 'Get Professional Help',
              ),

            ]),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  final IconData icon;
  final String title;

  const DrawerItems({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColour = Color.fromRGBO(55, 71, 79, 2);
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(
        icon,
        size: 30,
        color: customColour,
      ),
      title: Text(
        '$title',
        style: TextStyle(fontSize: 16, color: customColour),
      ),
    );
  }
}

class DrawerText extends StatelessWidget {
  final String text;

  const DrawerText({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final customColour = Color.fromRGBO(55, 71, 79, 2);

    return  Padding(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 5),
        child: Text('$text',
          style: TextStyle(fontWeight: FontWeight.w600,
              color: customColour),
        ));
  }
}