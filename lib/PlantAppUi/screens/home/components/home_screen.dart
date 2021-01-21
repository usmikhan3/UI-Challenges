import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'file:///F:/AndroidStudioProject/flutter_ui_complexity/lib/PlantAppUi/screens/home/components/body.dart';
import 'file:///F:/AndroidStudioProject/flutter_ui_complexity/lib/PlantAppUi/screens/home/components/my_bottom_navigation.dart';
import 'package:flutter_ui_complexity/PlantAppUi/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}


