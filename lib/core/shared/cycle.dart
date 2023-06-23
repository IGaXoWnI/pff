import 'package:flutter/material.dart';

class CycleWidget extends StatelessWidget {
  final String urlPath;
  final String categoriestitle;

  const CycleWidget({
    Key? key,
    required this.urlPath,
    required this.categoriestitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.5),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(urlPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            categoriestitle,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
