import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pff/controller/home_controller.dart';

import '../../data/models/categories_model.dart';

class CycleBoxs extends GetView<HomeControllerImp> {
  final String urlPath;
  final String categoriestitle;
  final int? i;
  final CategoriesModel categoriesModel;

  const CycleBoxs(
      {Key? key,
      required this.categoriesModel,
      required this.urlPath,
      required this.categoriestitle,
      required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.5),
      child: InkWell(
        onTap: () {
          controller.goToBoxs(controller.categories, i!,
              categoriesModel.categoriesId.toString());
        },
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
      ),
    );
  }
}
