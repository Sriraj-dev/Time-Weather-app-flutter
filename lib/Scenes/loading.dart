import 'package:flutter/material.dart';
import 'package:world_time/Services/timeProvider.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // void setupTime()async{
  //   //   WorldTime instance = new WorldTime(location: 'Kolkata', url: 'Asia/Kolkata');
  //   //   await instance.getTime();
  //   //
  //   //   print(instance.time);
  //   //
  //   // }
  void setLocations()async{
   late List<dynamic> data;
    WorldTime instance = new WorldTime(location: 'Kolkata', url: 'Asia/Kolkata');
    await instance.getLocations().then((value) {
      print(value);
      data = value;
    });
    Navigator.pushReplacementNamed(context, 'select',arguments: {
      'data' : data,
    });
    //await instance.getLocations();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //setupTime();
    setLocations();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:
      Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/search3.gif'),
            ),
          ),
        ),
      ),
    );
  }
}

//Asia/Kolkata
