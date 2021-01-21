import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_complexity/PlantAppUi/constants/constants.dart';
import 'package:flutter_ui_complexity/PlantAppUi/screens/details/components/title_price.dart';

import 'icon_card.dart';
import 'image_icons.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageAndIcons(size: size),
          TitleAndPrice(
            title: "Samantha\n",
            price: 500,
            country: "Russia",
          ),
          SizedBox(height: kDefaultPadding,),
          Row(
            children: [
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(20))),
                  color: kPrimaryColor,
                  onPressed: () {},
                  child: Text("Buy Now",style: TextStyle(color: Colors.white,fontSize: 16,),),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){},
                    child: Text("Description",style: TextStyle(color: Colors.black,fontSize: 16,)),
                ),
              )

            ],
          ),

        ],
      ),
    );
  }
}
