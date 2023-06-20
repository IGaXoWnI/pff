import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pff/controller/test_controller.dart';
import 'package:pff/core/class/handlingdataview.dart';
import 'package:pff/core/functions/checkinternet.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;

  initialdata() async {
    res = await checkinternet();
    print(res);
  }

  @override
  void initState() {
    initialdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataView(
          statusrequest: controller.statusrequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return Text("${controller.data}");
            },
          ),
        );
      }),
    );
  }
}
