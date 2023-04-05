import 'package:flutter/material.dart';

class offreWidget extends StatelessWidget {
  final String title;
  final String offreText;

  const offreWidget({
    super.key,
    required this.title,
    required this.offreText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset('assets/Images/offrecover.png'),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 35,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
          ),
        ),
        Positioned(
            bottom: 15,
            left: 35,
            child: Container(
              padding: EdgeInsets.all(9.0),
              decoration: BoxDecoration(
                color: Color(0xFFFF4200),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                offreText,
                style: TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}
