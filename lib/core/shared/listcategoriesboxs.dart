import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pff/core/constants/appColors.dart';
import 'package:pff/data/models/categories_model.dart';

import '../../controller/boxs_controller.dart';

class CategoriesListBoxs extends GetView<BoxsControllerImp> {
  CategoriesListBoxs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.categories.length,
      itemBuilder: (context, index) => Categories(
          categoriesModel:
              CategoriesModel.fromJson(controller.categories[index]),
          i: index),
    );
  }
}

class Categories extends GetView<BoxsControllerImp> {
  final int? i;
  final CategoriesModel categoriesModel;
  Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.5),
      child: InkWell(
        onTap: () {
          // controller.goToBoxs(controller.categories, i!);
          controller.changeCategories(i!);
        },
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            GetBuilder<BoxsControllerImp>(
              builder: (controller) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: controller.selectedcatgories == i
                      ? primaryColor
                      : Color.fromARGB(255, 244, 223, 223),
                ),
                height: 45,
                width: 90,
                child: Center(
                  child: Text(
                    "${categoriesModel.categoriesName}",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: controller.selectedcatgories == i
                            ? Colors.white
                            : null),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
