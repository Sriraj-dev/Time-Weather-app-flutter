import 'package:flutter/material.dart';
import 'package:world_time/Services/timeProvider.dart';

class Loading2 extends StatefulWidget {
  const Loading2({Key? key}) : super(key: key);

  @override
  _Loading2State createState() => _Loading2State();
}

class _Loading2State extends State<Loading2> {
  String location = 'Kolkata';
  String url = 'Asia/Kolkata';
  void setupTime()async{
    location = data['location'] ?? 'Kolkata';
    url = data['url'] ?? 'Asia/Kolkata';
    WorldTime instance = new WorldTime(location: location, url: url);
    await instance.getTime();

    print(instance.time);

    await instance.getTemperature();

    Navigator.pushReplacementNamed(context, 'home',arguments: {
      'time' : instance.time,
      'location' : instance.location,
      'isDay' : instance.isDay,
      'temperature' : instance.temperature,
      'weather' : instance.weather,
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var data ;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    setupTime();
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
