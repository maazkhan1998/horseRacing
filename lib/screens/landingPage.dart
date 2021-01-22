import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mks_racing/provider/raceCardTodayProvider.dart';
import 'package:mks_racing/screens/racingScreen/innerRacingScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import 'landingPages/competitionScreen.dart';
import 'landingPages/homeScreen.dart';
import 'landingPages/resultsScreen.dart';
import 'landingPages/settingScreen.dart';
import 'landingPages/statsScreen.dart';

int endTime = DateTime.now().millisecondsSinceEpoch + 5 * 60000;

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PersistentTabController _controller;
  bool isLoading = true;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    Future.delayed(Duration(seconds: 0), () async {
      try {
        await Provider.of<RaceCardTodayProvider>(context, listen: false)
            .getTodayRaceCard();
        setState(() => isLoading = false);
      } catch (e) {
        setState(() => isLoading = false);
        return Fluttertoast.showToast(msg: e.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: [
        isLoading ? Center(child: CircularProgressIndicator()) : HomeScreen(),
        isLoading
            ? Center(child: CircularProgressIndicator())
            : InnerRacingScreen(),
        isLoading
            ? Center(child: CircularProgressIndicator())
            : ResultsScreen(),
        isLoading ? Center(child: CircularProgressIndicator()) : StatsScreen(),
        isLoading
            ? Center(child: CircularProgressIndicator())
            : CompetitionScreen(),
        isLoading ? Center(child: CircularProgressIndicator()) : SettingScreen()
      ],
      items: [
        PersistentBottomNavBarItem(
            icon: ImageIcon(
              AssetImage('assets/Artboard 2 copy 5.png'),
            ),
            title: 'Home',
            inactiveColor: Colors.grey[700],
            activeColor: Colors.blue),
        PersistentBottomNavBarItem(
            icon: ImageIcon(AssetImage('assets/Artboard 2 copy 8.png')),
            title: 'Racing',
            inactiveColor: Colors.grey[700],
            activeColor: Colors.blue),
        PersistentBottomNavBarItem(
            icon: ImageIcon(AssetImage('assets/Artboard 2 copy 10.png')),
            title: 'Results',
            inactiveColor: Colors.grey[700],
            activeColor: Colors.blue),
        PersistentBottomNavBarItem(
          icon: ImageIcon(AssetImage('assets/Artboard 2 copy 12.png')),
          title: 'Stats',
          inactiveColor: Colors.grey[700],
          activeColor: Colors.blue,
        ),
        PersistentBottomNavBarItem(
            icon: ImageIcon(AssetImage('assets/Artboard 2 copy 14.png')),
            title: 'Competition',
            inactiveColor: Colors.grey[700],
            activeColor: Colors.blue),
        PersistentBottomNavBarItem(
            icon: ImageIcon(AssetImage('assets/Artboard 2 copy 16.png')),
            title: 'Settings',
            inactiveColor: Colors.grey[700],
            activeColor: Colors.blue)
      ],
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Chooe the nav bar style with this property.
    );
  }
}
