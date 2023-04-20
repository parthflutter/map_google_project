import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_google_project/screen/controller/map_controller.dart';

class Home_screen2 extends StatefulWidget {
  const Home_screen2({Key? key}) : super(key: key);

  @override
  State<Home_screen2> createState() => _Home_screen2State();
}

class _Home_screen2State extends State<Home_screen2> {
  Mapcontroller map = Get.put(Mapcontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          markers: {
            Marker(
              draggable: true,
              markerId: MarkerId("Locator"),
              position:
              LatLng(map.lan.value,map.lon.value),
            ),
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(map.lan.value, map.lon.value),
              zoom: 20),
        ),
      ),
    );
  }
}


