import 'package:get/get.dart';
import 'package:pff/core/services/services.dart';

class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? email;

  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
