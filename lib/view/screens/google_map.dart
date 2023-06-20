// ignore_for_file: unnecessary_null_comparison, override_on_non_overriding_member

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pff/core/shared/button.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  late Position currentP;
  var lat, long;
  late CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.352312, -9.551497),
    zoom: 14.4746,
  );
  late GoogleMapController gmc;
  Set<Marker> usermarker = {
    Marker(markerId: MarkerId("1"), position: LatLng(30.41614, -9.57554))
  };

  Future<LocationPermission> getPermission() async {
    bool service;
    LocationPermission per;
    service = await Geolocator.isLocationServiceEnabled();
    print(service);
    per = await Geolocator.checkPermission();
    print(per);
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }
    return per;
  }

  Future<void> getLatLong() async {
    currentP = await Geolocator.getCurrentPosition().then((value) => value);
    lat = currentP.latitude;
    long = currentP.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    setState(() {});
  }

  @override
  void initState() {
    getPermission();
    getLatLong();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              // Wrap the Stack with Expanded
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: _kGooglePlex == null
                        ? LinearProgressIndicator()
                        : GoogleMap(
                            markers: usermarker,
                            mapType: MapType.normal,
                            initialCameraPosition: _kGooglePlex,
                            onMapCreated: (GoogleMapController controller) {
                              gmc = controller;
                            },
                          ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15,
                    child: Btn(
                      btntext: "Add Your Address",
                      horizontal: 16,
                      raduis: 16,
                      vertical: 16,
                      size: 24,
                      onPressed: () async {
                        LatLng latLng = LatLng(lat, long);
                        gmc.animateCamera(CameraUpdate.newLatLng(latLng));
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: MediaQuery.of(context).size.width * 0.05,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(17),
                        image: DecorationImage(
                          image: AssetImage('assets/Icons/notification.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: MediaQuery.of(context).size.width * 0.05,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(17),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/Icons/curved/arrow-left.png'),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
