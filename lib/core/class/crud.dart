import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:pff/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<Statusrequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      if (response.statusCode == 200) {
        Map responsebody = jsonDecode(response.body);
        return right(responsebody);
      } else {
        return left(Statusrequest.serverfailure);
      }
    } else {
      return left(Statusrequest.offlinefailure);
    }
  }
}

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    // There is internet connectivity
    return true;
  } else {
    // There is no internet connectivity
    return false;
  }
}
