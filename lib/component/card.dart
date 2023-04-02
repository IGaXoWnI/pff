import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';




class card extends StatelessWidget {
  const card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 273,
                width: 286,
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Image.asset(
                            'assets/Images/cover.png',
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              color: Colors.black),
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
                                  'The Steak House',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '15min',
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
                                    Text('4.5',
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
              );
  }
}