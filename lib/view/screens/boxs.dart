// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pff/core/shared/boxscard.dart';
import 'package:pff/core/shared/listcategoriesboxs.dart';

import '../../controller/boxs_controller.dart';
import '../../core/shared/app_bar.dart';

class Boxs extends StatelessWidget {
  const Boxs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxsControllerImp controller = Get.put(BoxsControllerImp());
    return Scaffold(
      appBar: homeAppBar(context, ishomeappbar = false),
      body: Column(
        children: [
          Container(height: 60, child: Center(child: CategoriesListBoxs())),
          SizedBox(height: 20),
          Expanded(
            child: BoxsList(),
          ),
        ],
      ),
    );
  }
}
