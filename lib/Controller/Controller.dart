

import 'package:get/get.dart';

import 'package:googlemaps_in_flutter/Views/singlecity.dart';

class CityController extends GetxController {

  void getDetails(Map singleCityData) {
    print(singleCityData);
   Get.to(Singlecity(cityData: singleCityData ));
  
  }

  
  
 




}