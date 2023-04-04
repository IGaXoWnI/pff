import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pff/component/app_bar.dart';
import 'package:pff/constants/constants.dart';
import '../component/cardWidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user?.email);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _textEditingController;
    return Scaffold(
        appBar: homeAppBar(context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25, top: 35),
            child: Column(
              children: [
                Text(
                  'Rescue Food. Save Money!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: SvgPicture.asset(
                        'assets/Icons/search.svg',
                        width: 24,
                        height: 24,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {},
                    ),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(
                        'assets/Icons/filters-2.svg',
                        width: 24,
                        height: 24,
                        color: kPrimaryColor,
                      ),
                      onPressed: () => _textEditingController.clear(),
                    ),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 273,
                  child: Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CardWidget(
                          imgUrl: 'assets/Images/cover.png',
                          cardTitle: 'Barbecue Palace',
                          time: '15',
                          rating: '4.5',
                        ),
                        CardWidget(
                          imgUrl: 'assets/Images/cover.png',
                          cardTitle: 'The Steak House',
                          time: '20.5',
                          rating: '3.9',
                        ),
                        CardWidget(
                          imgUrl: 'assets/Images/cover.png',
                          cardTitle: 'Restaurant Douz Cool',
                          time: '10',
                          rating: '4.9',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
