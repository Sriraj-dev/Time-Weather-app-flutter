
import 'package:flutter/material.dart';
import 'package:world_time/Scenes/Loading2.dart';
import 'package:world_time/Scenes/home_page.dart';

import 'Scenes/loading.dart';
import 'Scenes/select_location.dart';

void main() {
  runApp(MaterialApp(
    //home : Home(),

    initialRoute: 'load',
    routes: {
      'load'   : (context) => Loading(),
      'home'   : (context) => Home(),
      'select' : (context) => Select(),
      'load2'  : (context) => Loading2(),
    },
  ));
}



