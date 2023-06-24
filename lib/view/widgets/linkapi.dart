class AppLink {
  static const String server = "http://localhost/myapp";
  static const String imagestatic = "http://localhost/myapp/upload";
  static const String imagecategories = "$imagestatic/categories";
  static const String imageboxs = "$imagestatic/boxs";

//test//
  static const String test = "$server/test1.php";

//=========auth=========//

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";

//=========home=========//

  static const String home = "$server/home.php";

//=========boxsview=========//

  static const String boxs = "$server/boxs/boxs.php";
}
