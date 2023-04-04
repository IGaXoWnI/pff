import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatelessWidget {
  final String imgUrl;
  final String cardTitle;
  final String time;
  final String rating;

  const CardWidget(
      {super.key,
      required this.imgUrl,
      required this.cardTitle,
      required this.time,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.5),
      child: Container(
        height: 273,
        width: 286,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Image.asset(
                    imgUrl,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                )),
            Expanded(
              flex: 1,
              child: Container(
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardTitle,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '$time min',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            SvgPicture.asset(
                              'assets/Icons/Star.svg',
                              width: 24,
                              height: 24,
                            ),
                            Text('$rating',
                                style: TextStyle(color: Colors.grey))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.07),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
