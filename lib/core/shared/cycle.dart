import 'package:flutter/material.dart';

class cycleWidget extends StatelessWidget {
  final String urlPath;

  const cycleWidget({
    super.key,
    required this.urlPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.5),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(urlPath),
          ),
        ),
      ),
    );
  }
}
