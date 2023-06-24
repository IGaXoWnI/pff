// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:pff/controller/boxs_controller.dart';
import 'package:pff/data/models/boxs_model.dart';

import '../../view/widgets/linkapi.dart';
import '../constants/appColors.dart';

class BoxsList extends StatelessWidget {
  const BoxsList({super.key});

  @override
  Widget build(BuildContext context) {
    BoxsControllerImp controller = Get.put(BoxsControllerImp());
    return GetBuilder<BoxsControllerImp>(
        builder: (controller) => ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return BoxCard(
                    boxsModel: BoxsModel.fromJson(controller.data[index]));
              },
            ));
  }
}

class BoxCard extends StatelessWidget {
  final BoxsModel boxsModel;
  const BoxCard({
    super.key,
    required this.boxsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
          height: 280,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.07),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.red,
                            image: DecorationImage(
                              image: NetworkImage(AppLink.imageboxs +
                                  "/" +
                                  boxsModel.boxsImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 30,
                          left: 15,
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(
                                image: NetworkImage(
                                  AppLink.imageboxs + "/" + boxsModel.boxsLogo!,
                                ),
                              ),
                            ),
                          ))
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
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
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  boxsModel.boxsName!,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                SvgPicture.asset(
                                  'assets/Icons/Star.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Spacer(),
                                Icon(
                                  LineAwesomeIcons.heart,
                                  size: 26,
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "25 min",
                                  textAlign: TextAlign.start,
                                ),
                                Spacer(),
                                Text("${boxsModel.boxesPrice!}\ MAD"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 25,
              ),
            ],
          )),
    );
  }
}
