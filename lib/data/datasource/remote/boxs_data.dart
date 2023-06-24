import 'package:pff/core/class/crud.dart';
import 'package:pff/view/widgets/linkapi.dart';

class BoxsData {
  Crud crud;

  BoxsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.boxs, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
