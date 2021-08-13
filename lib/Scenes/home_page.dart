import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,

      body:
      Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: data['isDay']?AssetImage('images/morning6.jpg'):AssetImage('images/night.jpg'),
               fit: BoxFit.fitHeight,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                       data['time']??'Unable to Load time',
                        style: TextStyle(
                    color: data['isDay']?Colors.black:Colors.white,
                  fontSize: 76,
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Icon(Icons.cloud,color: Colors.white,),

                    Text(
                      (data['temperature'] == -100)?'':'${data['temperature']} ',
                      style: TextStyle(
                        color: data['isDay']?Colors.black:Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      (data['temperature'] == -100)?'':'Celsius ,',
                      style: TextStyle(
                        color: data['isDay']?Colors.black:Colors.white,
                        fontSize: 25,
                      ),
                    ),

                    Text(
                      (data['temperature'] == -100)?'Climate Conditions not found!':'${data['weather']}',
                      style: TextStyle(
                        color: data['isDay']?Colors.black:Colors.white,
                        fontSize: (data['temperature'] == -100)?20:30,
                      ),
                    ),

                  ],
                ),

                Text(
                  data['location'],
                  style: TextStyle(
                    color: data['isDay']?Colors.black54:Colors.white70,
                    fontSize: 35,
                  ),

                )
              ],
            ),
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(

        onPressed: (){
          Navigator.pushNamed(context, 'load');
        },
       backgroundColor: data['isDay']?Colors.blue:Colors.purple[200],
        child: new Icon(Icons.location_on_sharp),
      ),
    );
  }
}
