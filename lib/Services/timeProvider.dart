//import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  String location;
  String url;
  late bool isDay;
  late String time;
  late double temperature;
  late String weather;
  WorldTime({required this.location,required this.url});
  String apikey = '41619a46c0fd3198bb3157aa33cc423b';
   Future<void> getTime() async{
     print('Requesting $url');
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    if(response.statusCode==200){
      print('Succesfull');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      print(datetime);
      print(data['utc_offset']);
      String offset1 = data['utc_offset'].substring(1,3);

      String offset2 = data['utc_offset'].substring(4);

      DateTime now = DateTime.parse(datetime);
      print(now);
     now = now.add(Duration(hours: int.parse(offset1),minutes: int.parse(offset2)));
      print(now);
      isDay = (now.hour >=6 && now.hour<18)?true:false;
      time = DateFormat.jm().format(now);
      print(time);
    }else{
      print('Unsuccesfull');
    }


  }
  
  Future<List<dynamic>> getLocations()async{
     Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone'));
     if(response.statusCode == 200){
       var data  = json.decode(response.body);
       print(data[50]);

       return data;
     }else{
       return ['Unable to load Locations'];
     }

  }

  getTemperature() async{
     String tempUrl = 'http://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apikey';
     Response response = await get(Uri.parse(tempUrl));

     if(response.statusCode==200){
       print('Got Weather Info!!!');
       var data = jsonDecode(response.body);
       temperature = (data['main']['temp'] - 273.0).roundToDouble();
       print(data['main']['temp']);
       print(temperature);
       weather = data['weather'][0]['main'];
       print(data['weather'][0]['main']);
     }else{
       print('Error in taking weather');
       temperature = -100;
       weather = 'No info!';
     }


  }
}