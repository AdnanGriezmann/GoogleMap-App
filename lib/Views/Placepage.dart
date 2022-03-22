import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlemaps_in_flutter/Controller/Controller.dart';
import 'package:googlemaps_in_flutter/Controller/internetcheckcontroller.dart';
import 'package:googlemaps_in_flutter/Model/model.dart';

import 'package:sizer/sizer.dart';

class Placepage extends StatelessWidget {
  Placepage({Key? key}) : super(key: key);

  final controller = Get.put(CityController());
  final checkcon = Get.put(checkInternet());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(221, 117, 185, 240),
        title: Text(
          "Google Maps",
          style: TextStyle(
              color: Color.fromARGB(255, 247, 194, 4),
              fontWeight: FontWeight.bold,
              fontSize: 18.0.sp),
        ),
      ),
      body: ListView.builder(
        itemCount: cityList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Column(
              children: [
                Image.network(
                  cityList[index]['image'],
                  height: 22.0.h,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0.sp),
                      child: Text(
                        cityList[index]['name'],
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(onPrimary: Colors.amber),
                      onPressed: () {
                        controller.getDetails(cityList[index]);
                      },
                      child: Text("View Details"),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
