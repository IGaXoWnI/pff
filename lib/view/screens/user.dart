// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:pff/controller/home_controller.dart';
import 'package:pff/view/screens/login.dart';

import '../../core/constants/appColors.dart';

class UserMenu extends StatelessWidget {
  UserMenu({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              image: DecorationImage(
                image: AssetImage('assets/Icons/curved/arrow-left.png'),
              ),
            ),
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                            image: AssetImage("assets/Images/Profile.jpeg")),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromARGB(255, 244, 215, 205)),
                        child: Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: kPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${controller.username}",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${controller.email}",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      backgroundColor: Color.fromARGB(255, 244, 146, 113),
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                profilemenuwidget(
                  title: 'Settings',
                  icon: LineAwesomeIcons.cog,
                  onPress: () {},
                ),
                SizedBox(
                  height: 8,
                ),
                profilemenuwidget(
                  title: 'Billing Details',
                  icon: LineAwesomeIcons.wallet,
                  onPress: () {},
                ),
                SizedBox(
                  height: 8,
                ),
                profilemenuwidget(
                  title: 'User Management',
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                profilemenuwidget(
                  title: 'Information',
                  icon: LineAwesomeIcons.info,
                  onPress: () {},
                ),
                SizedBox(
                  height: 8,
                ),
                profilemenuwidget(
                  title: 'Log Out',
                  icon: LineAwesomeIcons.alternate_sign_out,
                  onPress: () async {
                    await FirebaseAuth.instance.signOut();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  endIcon: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class profilemenuwidget extends StatelessWidget {
  const profilemenuwidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromARGB(255, 244, 215, 205)),
        child: Icon(
          icon,
          color: kPrimaryColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
      ),
      trailing: endIcon
          ? Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 236, 234, 234)),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                color: kPrimaryColor,
              ),
            )
          : null,
    );
  }
}
