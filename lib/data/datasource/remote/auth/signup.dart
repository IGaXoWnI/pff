import 'package:pff/core/class/crud.dart';
import 'package:pff/view/widgets/linkapi.dart';

class SignupData {
  Crud crud;

  SignupData(this.crud);

  postData(
    String username,
    String email,
    String password,
  ) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
