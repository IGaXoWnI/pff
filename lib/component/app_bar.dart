import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pff/constants/constants.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/Icons/menu.svg"),
      onPressed: () {},
    ),
    title: Column(
      children: [
        Text(
          'Deliver to '.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: Colors.black, fontSize: 14),
        ),
        Text(
          'Inezgane'.toUpperCase(),
          style: TextStyle(color: kPrimaryColor),
        )
      ],
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/Icons/notification.svg"),
        onPressed: () {},
      ),
    ],
  );
}
