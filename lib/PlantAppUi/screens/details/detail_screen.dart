import 'package:flutter/material.dart';
import 'package:flutter_ui_complexity/PlantAppUi/screens/details/components/body.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Body(),
    );
  }
}
