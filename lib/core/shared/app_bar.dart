import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pff/view/screens/google_map.dart';

late Position currentP;
bool ishomeappbar = true;

AppBar homeAppBar(BuildContext context, bool ishomeappbar, ) {
  return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/Icons/notification.png'),
              ),
            ),
          ),
        )
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: ishomeappbar
          ? null
          : GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  image: DecorationImage(
                    image: AssetImage('assets/Icons/curved/arrow-left.png'),
                  ),
                ),
              ),
            ),
      title: ishomeappbar
          ? Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your Location',
                          style:
                              TextStyle(color: Color(0xff9D9693), fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () async {
                            currentP = await getLatLong();
                            print("LAT ${currentP.latitude}");
                            print("LONG ${currentP.longitude}");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Map()),
                            );
                          },
                          icon: SvgPicture.asset('assets/Icons/small-down.svg'),
                        ),
                      ],
                    ),
                    Text(
                      'Tarrast,Inezgane',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  ],
                ),
              ),
            )
          : Text("boxs", style: TextStyle(color: Colors.black, fontSize: 22)));
}

Future getPosition() async {
  bool service;
  LocationPermission per;
  service = await Geolocator.isLocationServiceEnabled();
  print(service);
  per = await Geolocator.checkPermission();
  print(per);
  if (per == LocationPermission.denied) {
    per = await Geolocator.requestPermission();
    if (per == LocationPermission.whileInUse) {
      getLatLong();
    }
  }
}

Future<Position> getLatLong() async {
  return await Geolocator.getCurrentPosition().then((value) => value);
}
