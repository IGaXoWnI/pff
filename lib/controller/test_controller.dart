import 'package:get/get.dart';
import 'package:pff/core/class/statusrequest.dart';
import 'package:pff/data/datasource/remote/test_data.dart';

import '../core/functions/handlingdatacontrol.dart';

class TestController extends GetxController {
  TestData testdata = TestData(Get.find());
  List data = [];
  late Statusrequest statusrequest;
  getData() async {
    statusrequest = Statusrequest.loading;
    var response = await testdata.getData();
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

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
