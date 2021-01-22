import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:mks_racing/provider/authProvider.dart';
import 'package:mks_racing/provider/raceCardTodayProvider.dart';
import 'package:mks_racing/screens/loginScreen.dart';
import 'package:provider/provider.dart';

import 'screens/landingPage.dart';

main() => runApp(MyApp());

double devHeight;
double devWidth;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 683),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: AuthProvider()),
          ChangeNotifierProxyProvider<AuthProvider, RaceCardTodayProvider>(
              create: (_) => RaceCardTodayProvider(null),
              update: (ctx, auth, prevProducts) =>
                  RaceCardTodayProvider(auth.token))
        ],
        child: Consumer<AuthProvider>(
          builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: auth.isAuth ? LandingPage() : LoginScreen(),
          ),
        ),
      ),
    );
  }
}
