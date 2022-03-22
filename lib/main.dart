import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:googlemaps_in_flutter/Views/Placepage.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Google Maps',
        theme: ThemeData(
          primaryColor: Colors.orange,
        ),
     
        home: Placepage(),
      );
    });
  }
}