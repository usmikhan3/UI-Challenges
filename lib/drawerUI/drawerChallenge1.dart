import 'dart:math';

import 'package:flutter/material.dart';

class DrawerChallenge1 extends StatefulWidget {
  @override
  _DrawerChallenge1State createState() => _DrawerChallenge1State();
}

class _DrawerChallenge1State extends State<DrawerChallenge1>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  static const double maxSlide = 225.0;
  static const double minDragStartEdge = 60;
  static const double maxDragStartEdge = maxSlide - 16;
  bool _canBeDragged = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }



  void onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight = animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged  = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void onDragUpdate(DragUpdateDetails details){
    if(_canBeDragged){
      double delta = details.primaryDelta / maxSlide;
      animationController.value +=delta;
    }
  }


  void onDragEnd(DragEndDetails details){


    if(animationController.isDismissed || animationController.isCompleted){
      double visualVelocity = details.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.width;
      animationController.fling(velocity: visualVelocity);
    }else if(animationController.value < 0.5){
      close();
    }else{
      open();
    }
  }
  void close() => animationController.reverse();

  void open() => animationController.forward();

  void toggle() {
    animationController.isCompleted
        ? close()
        : open();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myDrawer = Container(color: Colors.blue);
    var myChild = Container(color: Colors.yellow);
    return WillPopScope(

      onWillPop: ()async{
        if(animationController.isCompleted){
          close();
          return false;
        }
        return true;
      },
      child: GestureDetector(
        onHorizontalDragStart: onDragStart,
        onHorizontalDragUpdate: onDragUpdate,
        onHorizontalDragEnd: onDragEnd,
        onTap: toggle,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            double slide = maxSlide * animationController.value;
            double scale = 1 - (animationController.value * 0.3);
            return Stack(
              children: [
                MyDrawer(),
                Transform(
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    alignment: Alignment.centerLeft,
                    child: myChild),


              ],
            );
          },
        ),
      ),
    );
  }
}


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
              ListTile(
                leading: Icon(Icons.new_releases),
                title: Text('News'),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Favourites'),
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Map'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
