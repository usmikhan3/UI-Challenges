import 'package:flutter/material.dart';
import 'package:flutter_ui_complexity/PlantAppUi/constants/constants.dart';
import 'package:flutter_ui_complexity/PlantAppUi/screens/details/detail_screen.dart';

class RecommendPlants extends StatelessWidget {
  const RecommendPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommendPlantCard(
            image: "assets/images/image_1.png",
            title: "Samantha",
            country: "Russia",
            press: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailScreen()));
            },
            price: 500,
          ),
          RecommendPlantCard(
            image: "assets/images/image_2.png",
            title: "Alex",
            country: "America",
            press: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailScreen()));
            },
            price: 500,
          ),
          RecommendPlantCard(
            image: "assets/images/image_3.png",
            title: "Angelica",
            country: "Russia",
            press: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailScreen()));
            },
            price: 500,
          )
        ],
      ),
    );
  }
}

class RecommendPlantCard extends StatelessWidget {
  const RecommendPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding * 2.5),
      //it will cover 40% of total width
      width: size.width * 0.4,
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23))
                  ]),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button),
                      TextSpan(
                          text: "$country".toUpperCase(),
                          style:
                          TextStyle(color: kPrimaryColor.withOpacity(0.5)))
                    ]),
                  ),
                  Spacer(),
                  Text("\$$price",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: kPrimaryColor))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
