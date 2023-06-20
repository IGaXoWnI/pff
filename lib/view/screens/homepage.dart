// ignore_for_file: deprecated_member_use, unused_import
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pff/core/shared/app_bar.dart';
import 'package:pff/core/shared/cycle.dart';
import 'package:pff/core/shared/offre.dart';
import 'package:pff/core/constants/appColors.dart';
import 'package:pff/core/shared/cardWidget.dart';
import 'package:pff/core/constants/imageAssets.dart';
import 'package:pff/view/screens/user.dart';

import '../Routing/App_route.dart';

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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 12,
          ),
          child: GNav(
              backgroundColor: Colors.transparent,
              activeColor: kPrimaryColor,
              color: Colors.grey,
              tabBackgroundColor: Color(0xffFFE8E0),
              padding: EdgeInsets.all(18),
              gap: 8,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home ',
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Favorite',
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Cart',
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Account',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserMenu()),
                  ),
                ),
              ]),
        ),
        appBar: homeAppBar(context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 35),
            child: Column(
              children: [
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
                offreWidget(
                  title: 'Breakfast \nBest Deals',
                  offreText: 'UP TO 40% OFF',
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 100,
                  child: Expanded(
                      child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      cycleWidget(
                        urlPath: AppIcons.vegan,
                      ),
                      cycleWidget(
                        urlPath: AppIcons.healthy,
                      ),
                      cycleWidget(
                        urlPath: AppIcons.goodfood,
                      ),
                      cycleWidget(
                        urlPath: AppIcons.smartResto,
                      ),
                      cycleWidget(
                        urlPath: AppIcons.kfc,
                      ),
                      cycleWidget(
                        urlPath: AppIcons.macdo,
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Restaurants Near You',
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 273,
                  child: Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CardWidget(
                          imgUrl: AppImages.cover1,
                          cardTitle: 'Barbecue Palace',
                          time: '15',
                          rating: '4.5',
                        ),
                        CardWidget(
                          imgUrl: AppImages.cover2,
                          cardTitle: 'The Steak House',
                          time: '20.5',
                          rating: '3.9',
                        ),
                        CardWidget(
                          imgUrl: AppImages.cover1,
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
