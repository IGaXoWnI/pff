import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pff/core/class/statusrequest.dart';

import '../constants/imageAssets.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView(
      {super.key, required this.statusrequest, required this.widget});
  final Statusrequest statusrequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(
            child: Lottie.asset(AppLottie.loading, height: 250, width: 250),
          )
        : statusrequest == Statusrequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppLottie.offline, height: 250, width: 250),
              )
            : statusrequest == Statusrequest.serverfailure
                ? Center(
                    child:
                        Lottie.asset(AppLottie.server, height: 250, width: 250),
                  )
                : statusrequest == Statusrequest.failure
                    ? Center(
                        child: Lottie.asset(AppLottie.no_data,
                            height: 250, width: 250))
                    : widget;
  }
}
