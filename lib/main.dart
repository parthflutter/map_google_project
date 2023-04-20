import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_google_project/screen/view/home_screen.dart';
import 'package:map_google_project/screen/view/map_screen2.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => Map_screen(),
        'Home_screen2':(p0) => Home_screen2(),
      },
    ),
  );
}

