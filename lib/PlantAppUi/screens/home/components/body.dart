import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'featured_plants.dart';
import 'file:///F:/AndroidStudioProject/flutter_ui_complexity/lib/PlantAppUi/screens/home/components/recommend_plants.dart';
import 'package:flutter_ui_complexity/PlantAppUi/constants/constants.dart';
import 'package:flutter_ui_complexity/PlantAppUi/screens/home/components/title_with_more_btn.dart';


import 'header_with_searchbar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //it will provide total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recommended", press: () {}),
          RecommendPlants(),
          TitleWithMoreBtn(title:"Featured Plants",press: (){},),
          FeaturedPlants(),
          SizedBox(height:kDefaultPadding ,)

        ],
      ),
    );
  }
}



