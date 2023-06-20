import 'package:get/instance_manager.dart';
import 'package:pff/core/class/crud.dart';

class initialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
