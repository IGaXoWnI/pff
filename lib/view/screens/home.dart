// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constants/appColors.dart';
import '../../core/shared/app_bar.dart';
import '../../core/shared/cardWidget.dart';
import '../../core/shared/cycle.dart';
import '../../core/shared/offre.dart';
import '../widgets/linkapi.dart';

class Home extends StatelessWidget {
  var _textEditingController;
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
              statusrequest: controller.statusrequest,
              widget: Scaffold(
                appBar: homeAppBar(context),
                body: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 35),
                  child: Column(
                    children: [
                      TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: SvgPicture.asset(
                              'assets/Icons/search.svg',
                              width: 24,
                              height: 24,
                              color: kPrimaryColor,
                            ),
                            onPressed: () {},
                          ),
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                              'assets/Icons/filters-2.svg',
                              width: 24,
                              height: 24,
                              color: kPrimaryColor,
                            ),
                            onPressed: () => _textEditingController.clear(),
                          ),
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      offreWidget(
                        title: 'Breakfast \nBest Deals',
                        offreText: 'Check the Offers',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categories
                              .length, // Replace with the actual number of items in the list
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: CycleWidget(
                                urlPath:
                                    "${AppLink.imagecategories}/${controller.categories[index]['categories_image']}",
                                categoriestitle:
                                    '${controller.categories[index]['categories_name']}',
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Restaurants Near You',
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 273,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.boxs
                              .length, // Replace with the actual number of items in your list
                          itemBuilder: (BuildContext context, int index) {
                            return CardWidget(
                              imgUrl:
                                  "${AppLink.imageboxs}/${controller.boxs[index]['boxs_image']}",
                              cardTitle:
                                  "${controller.boxs[index]['boxs_name']}",
                              rating: "5",
                              logo:
                                  "${AppLink.imageboxs}/${controller.boxs[index]['boxs_logo']}",
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
