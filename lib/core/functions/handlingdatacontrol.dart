import 'package:pff/core/class/statusrequest.dart';

handlingData(Response) {
  if (Response is Statusrequest) {
    return Response;
  } else {
    return Statusrequest.succes;
  }
}
