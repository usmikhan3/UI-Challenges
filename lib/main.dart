import 'package:flutter/material.dart';
import 'package:flutter_ui_complexity/CreditCardUi/screens/home_screen.dart';
import 'package:flutter_ui_complexity/PlantAppUi/constants/constants.dart';
import 'file:///F:/AndroidStudioProject/flutter_ui_complexity/lib/PlantAppUi/screens/home/components/home_screen.dart';
import 'package:flutter_ui_complexity/drawerUI/drawerChallenge1.dart';
import 'package:flutter_ui_complexity/drawerUI/drawerChallenge2.dart';
import 'drawerUI/example.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Circular',
        scaffoldBackgroundColor:kBackgroundColor ,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DrawerChallenge2(),
    );
  }
}


