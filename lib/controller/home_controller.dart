import 'package:get/get.dart';
import 'package:pff/core/services/services.dart';
import 'package:pff/view/Routing/App_route.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontrol.dart';
import '../data/datasource/remote/home_data.dart';

abstract class HomeController extends GetxController {
  HomeData homedata = HomeData(Get.find());
  List data = [];
  List categories = [];
  List boxs = [];

  late Statusrequest statusrequest;
  initialData();
  getdata();
  goToBoxs(List categories, int selectedcatgories, String categoriesid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? email;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
  }

  @override
  void onInit() {
    initialData();
    getdata();
    super.onInit();
  }

  @override
  getdata() async {
    statusrequest = Statusrequest.loading;
    var response = await homedata.getData();
    statusrequest = handlingData(response);
    if (Statusrequest.succes == statusrequest) {
      if (response["status"] == "success") {
        categories.addAll(response["categories"]);
        boxs.addAll(response["boxs"]);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  goToBoxs(categories, selectedcatgories, categoriesid) {
    Get.toNamed(AppRoute.boxs.name, arguments: {
      "categories": categories,
      "selectedcatgories": selectedcatgories,
      "catid": categoriesid,
    });
  }
}
