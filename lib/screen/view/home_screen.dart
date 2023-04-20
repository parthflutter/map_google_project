import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:map_google_project/screen/controller/map_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class Map_screen extends StatefulWidget {
  const Map_screen({Key? key}) : super(key: key);

  @override
  State<Map_screen> createState() => _Map_screenState();
}
class _Map_screenState extends State<Map_screen> {
  Mapcontroller map = Get.put(Mapcontroller());
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () async {
    var status = await Permission.location.status;
    if (status.isDenied)
        {
          Permission.location.request();
        }
    },
        child: Text("Location Permission")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () async {
              Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
              map.lan.value=position.latitude;
              map.lon.value=position.longitude;
            }, child: Text("Lan and lon"),
            ),
            Obx(() =>  Text("${map.lan.value}")),
            SizedBox(height: 10,),
            Obx(() =>  Text("${map.lon.value}")),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{
              List<Placemark> placemarkList = await placemarkFromCoordinates(map.lan.value, map.lon.value);
              map.placeList.value = placemarkList;
            }, child: Text("Tracker"),),
            SizedBox(height: 30,),
            Obx(() => Text(map.placeList.isEmpty?" ":"${map.placeList[0]}")),
        ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('Home_screen2');
        },child: Icon(Icons.location_pin),
      ),
    ),
    );

  }
}

