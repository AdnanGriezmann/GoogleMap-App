import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:maps_launcher/maps_launcher.dart';
import 'package:sizer/sizer.dart';

class Singlecity extends StatefulWidget {
  final Map cityData;

  Singlecity({Key? key, required this.cityData}) : super(key: key);

  @override
  State<Singlecity> createState() => _SinglecityState();
}

class _SinglecityState extends State<Singlecity> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    setState(() {
      final marker = Marker(
        // icon: pinLocationIcon!,
        markerId: MarkerId(widget.cityData['name']),
        position: LatLng(widget.cityData['lat'], widget.cityData['lng']),
        infoWindow: InfoWindow(
            title: widget.cityData['name'],
            snippet: widget.cityData['address'],
            onTap: () {
              print("${widget.cityData['lat']}, ${widget.cityData['lng']}");
            }),
        onTap: () {
          print("Clicked on marker");
        },
      );
      print("${widget.cityData['lat']}, ${widget.cityData['lng']}");
      _markers[widget.cityData['name']] = marker;
    });
  }

  launchMap(lat,long) {
    MapsLauncher.launchCoordinates(lat!, long!);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(221, 117, 185, 240),
          title: Text('About ${widget.cityData['name']}',
              style: TextStyle(
                  color: Color.fromARGB(255, 247, 194, 4),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0.sp))),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                Image.network(
                  widget.cityData['image'],
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
                        widget.cityData['name'],
                        style: TextStyle(
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        launchMap(widget.cityData['lat'], widget.cityData['lng']);
                      },
                      child: const Text("Direction"),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.cityData['lat'], widget.cityData['lng']),
                zoom: 7,
              ),
              markers: _markers.values.toSet(),
            ),
          )
        ],
      ),
    );
  }
}
