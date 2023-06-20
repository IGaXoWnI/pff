import 'package:pff/core/class/crud.dart';
import 'package:pff/view/widgets/linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homeApi, {});
    return response.fold((error) => 1, (r) => r);
  }
}
