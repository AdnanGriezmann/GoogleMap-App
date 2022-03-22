import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class checkInternet extends GetxController {
  var connectionType = "".obs;

  @override
  void onInit() {
    super.onInit();
    getconectionStatus();
  }

  final Connectivity connectivity = Connectivity();

  Future<void> getconectionStatus() async {
    var connectivityResult;
    try {
      connectivityResult = await connectivity.checkConnectivity();
      getConnectionType(connectivityResult);
    } catch (e) {
      Get.snackbar('Exception', 'Opps error during checking',
          borderColor: Colors.blueAccent,
          backgroundColor: Colors.black,
          colorText: Colors.white);
    }
  }

  void getConnectionType(connectivityResult) {
    if (connectivityResult == ConnectivityResult.wifi) {
      Get.snackbar('WI-FI', 'WI-FI is connected ');
      // borderColor: Colors.blueAccent,
      // backgroundColor: Colors.black,
      // colorText: Colors.white);
    } else if (connectivityResult == ConnectivityResult.mobile) {
      Get.snackbar('Mobile Data', 'Mobile internet is connected');
    } else {
      Get.snackbar('Not Connected', 'Internet is not connected');
      // borderColor: Colors.blueAccent,
      // backgroundColor: Colors.black,
      // colorText: Colors.white);
    }
  }
}
