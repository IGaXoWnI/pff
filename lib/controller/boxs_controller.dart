// ignore_for_file: override_on_non_overriding_member

import 'package:get/get.dart';
import 'package:pff/data/datasource/remote/boxs_data.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontrol.dart';

abstract class BoxsController extends GetxController {
  initialData();
  changeCategories(int val);
  getBoxs(String categoriesid);
}

class BoxsControllerImp extends BoxsController {
  List categories = [];
  String? catid;
  int? selectedcatgories;

  @override
  void onInit() {
    initialData();
    getBoxs(catid!);
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments["categories"];
    selectedcatgories = Get.arguments["selectedcatgories"];
    catid = Get.arguments["catid"];
  }

  @override
  changeCategories(val) {
    selectedcatgories = val;
    update();
  }

  @override
  BoxsData boxsData = BoxsData(Get.find());
  List data = [];
  late Statusrequest statusrequest;
  getBoxs(categoriesid) async {
    statusrequest = Statusrequest.loading;
    var response = await boxsData.getData(categoriesid);
    statusrequest = handlingData(response);
    if (Statusrequest.succes == statusrequest) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }
}
