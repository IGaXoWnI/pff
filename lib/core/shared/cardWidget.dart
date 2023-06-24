import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../data/models/boxs_model.dart';
import '../../view/widgets/linkapi.dart';

class CardList extends GetView<HomeControllerImp> {
  CardList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller
          .boxs.length, // Replace with the actual number of items in your list
      itemBuilder: (BuildContext context, int index) {
        return CardWidget(
            boxsModel: BoxsModel.fromJson(controller.boxs[index]));
      },
    );
  }
}

class CardWidget extends GetView<HomeControllerImp> {
  final BoxsModel boxsModel;

  const CardWidget({
    super.key,
    required this.boxsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.5),
      child: Container(
        height: 250,
        width: 260,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          "${AppLink.imageboxs}/${boxsModel.boxsImage}",
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 10,
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                              image: NetworkImage(
                                  "${AppLink.imageboxs}/${boxsModel.boxsLogo}")),
                        ),
                      ),
                    )
                  ],
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
                          "${boxsModel.boxsName}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '25 min',
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
                            Text("5", style: TextStyle(color: Colors.grey))
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
