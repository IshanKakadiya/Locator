// ignore_for_file: unused_local_variable, avoid_print, unused_field

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //
  checkPermission() async {
    PermissionStatus permission = await Permission.location.request();

    print("----------------------------");
    print(permission);
    print("----------------------------");
  }

  loction() async {
    Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        lat = position.latitude;
        long = position.longitude;
        print("------------------------");
        print(lat);
        print(long);
        print("------------------------");
      });
    });
  }

  double lat = 0;
  double long = 0;

  Completer<GoogleMapController> googleMapController = Completer();
  late CameraPosition position;

  @override
  void initState() {
    super.initState();
    checkPermission();
    loction();
    position = CameraPosition(
      target: LatLng(lat, long),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Loction"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              await openAppSettings();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Live Location",
                    style: GoogleFonts.openSans(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "$lat, $long",
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: GoogleMap(
              mapType: MapType.satellite,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                googleMapController.complete(controller);
              },
              initialCameraPosition: position,
              markers: {
                Marker(
                  markerId: const MarkerId("Current Location"),
                  position: LatLng(lat, long),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
