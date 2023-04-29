import 'package:companion/pages/quiz.dart';
import 'package:flutter/material.dart';


class Cardandlist extends StatefulWidget {
  // final IconData iconii;
  // final String ttext;
  // final Widget customchild;
  // void Function() clickaction;
  // Cardandlist({Key key, this.iconii, this.ttext, this.customchild, this.clickaction, }) : super(key: key);

  @override
  _CardandlistState createState() => _CardandlistState();
}

class _CardandlistState extends State<Cardandlist> {


  bool rowvisisix=false;
  bool rowvisinine=false;

  void  visibisix(){
    setState(() {
      rowvisisix=!rowvisisix;
      rowvisisix=true;
      rowvisinine=false;
      rowvisinine=false;

    });
  }
  void  visibinine(){
    setState(() {
      rowvisinine=!rowvisinine;
      rowvisinine=true;
      rowvisisix=false;
      rowvisisix=false;


    });
  }
  @override
  Widget build(BuildContext context) {
    final colo=Color.fromRGBO(55, 71, 79, 2);

    return Column(children: [

      ListTile(

        leading: Icon(Icons.motion_photos_on_sharp,color: colo,size: 30,),
        title: Text('Stress Buster',style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: colo ),),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          print("working on click");
          visibisix();
        },
      ),

      Visibility(
        visible: rowvisisix,
        child: Container(
            height: 170,
            child: ListView(scrollDirection: Axis.horizontal,
              children: [
                Cuscard(
                  imgloc: 'assets/manwithplant.png',
                  discri: 'music',),
              ],)
        ),
      ),
//stress
      ListTile(

        leading: Icon(Icons.person_sharp,color: colo,size: 30,),
        title: Text('Take a depression test.',style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: colo ),),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
      ),
      SizedBox(
        height:25,
      )

    ]);
  }
}
//Digital

class Cuscard extends StatelessWidget {
  final String imgloc;
  final String discri;
  const Cuscard({Key key, this.imgloc, this.discri}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return  Container(
      margin: EdgeInsets.all(10),
      width: 150,


      child: Card(elevation: 1.5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)),
        // color: Colors.red,
        child: Center(
          child: Column(children:[
            Image.asset('$imgloc',width: 100,height: 100,),
            Text("$discri",style: TextStyle(fontSize: 17,color:Color.fromRGBO(55, 71, 79, 2),),textAlign: TextAlign.center,),

          ]),
        ),

      ),
    );
  }
}