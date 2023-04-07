import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
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
      title: Padding(
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
                    style: TextStyle(color: Color(0xff9D9693), fontSize: 16),
                  ),
                  IconButton(
                    onPressed: () {},
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
      ));
}
