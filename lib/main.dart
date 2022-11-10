// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, avoid_print, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List permissionList = [
    {
      "id": "1",
      "title": "Location",
      "icon": const Icon(Icons.location_on),
      "permissionStatus": false,
    },
    {
      "id": "2",
      "title": "Camera",
      "icon": const Icon(Icons.camera_alt),
      "permissionStatus": false,
    },
    {
      "id": "3",
      "title": "Bluetooth",
      "icon": const Icon(Icons.bluetooth_audio_outlined),
      "permissionStatus": false,
    },
    {
      "id": "4",
      "title": "Calendar",
      "icon": const Icon(Icons.calendar_month),
      "permissionStatus": false,
    },
    {
      "id": "5",
      "title": "Microphone",
      "icon": const Icon(Icons.mic),
      "permissionStatus": false,
    },
    {
      "id": "6",
      "title": "Contacts",
      "icon": const Icon(Icons.contacts),
      "permissionStatus": false,
    },
    {
      "id": "7",
      "title": "Media Location",
      "icon": const Icon(Icons.file_copy),
      "permissionStatus": false,
    },
    {
      "id": "8",
      "title": "Photos",
      "icon": const Icon(Icons.photo),
      "permissionStatus": false,
    },
    {
      "id": "9",
      "title": "Sms",
      "icon": const Icon(Icons.sms),
      "permissionStatus": false,
    },
    {
      "id": "10",
      "title": "Sensors",
      "icon": const Icon(Icons.sensors),
      "permissionStatus": false,
    },
    {
      "id": "11",
      "title": "Notifications",
      "icon": const Icon(Icons.notifications_active),
      "permissionStatus": false,
    },
  ];

  List<Permission> permission = [
    //1
    Permission.location,
    //2
    Permission.camera,
    //3
    Permission.bluetooth,
    //4
    Permission.calendar,
    //5
    Permission.microphone,
    //6
    Permission.contacts,
    //7
    Permission.accessMediaLocation,
    //8
    Permission.photos,
    //9
    Permission.sms,
    //10
    Permission.sensors,
    //11
    Permission.notification,
  ];

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  checkPermission() async {
    for (int i = 0; i < permission.length; i++) {
      permissionList[i]["permissionStatus"] = await permission[i].isGranted;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Permission"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.info_outline,
            size: 30,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    alignment: Alignment.center,
                    title: const Text("About Information"),
                    content: Container(
                      height: _height * 0.1,
                      width: _width,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Permission Is Allow",
                                style: GoogleFonts.openSans(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Permission Is Denied",
                                style: GoogleFonts.openSans(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        child: Text(
                          "Close",
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: 1),
                    ],
                  );
                });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              await openAppSettings();
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        itemCount: permissionList.length,
        separatorBuilder: (context, i) => const SizedBox(height: 15),
        itemBuilder: (context, i) {
          return InkWell(
            child: Container(
              height: _height * 0.07,
              width: _width,
              padding:
                  const EdgeInsets.only(left: 15, right: 5, bottom: 5, top: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  permissionList[i]["icon"],
                  const SizedBox(width: 25),
                  Text(
                    permissionList[i]["title"],
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: (permissionList[i]["permissionStatus"])
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            onTap: () async {
              permissionList[i]["permissionStatus"] =
                  await permission[i].isGranted;

              print("--------------------");
              print(permissionList[i]["permissionStatus"]);
              print("--------------------");

              setState(() {});

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    alignment: Alignment.center,
                    title: Center(
                      child: Text(
                        "${permissionList[i]["title"]} Permission",
                        style: GoogleFonts.openSans(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    content: Container(
                      height: _height * 0.13,
                      width: _width,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            (permissionList[i]["permissionStatus"])
                                ? "Permission Is Allow"
                                : "Permission Is Denied",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            (permissionList[i]["permissionStatus"])
                                ? "* Press Settings If You Want \nTo Denied Permission"
                                : "* Press Request If You Want \nTo Allow Permission",
                            style: GoogleFonts.openSans(
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        child: Text(
                          (permissionList[i]["permissionStatus"] == false)
                              ? "Cancle"
                              : "Close",
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      (permissionList[i]["permissionStatus"] == false)
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              child: Text(
                                "Request",
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () async {
                                await permission[i].request();
                                permissionList[i]["permissionStatus"] =
                                    await permission[i].isGranted;
                                setState(() {});
                                Navigator.of(context).pop();
                              },
                            )
                          : Container(width: 3),
                      const SizedBox(width: 1),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
