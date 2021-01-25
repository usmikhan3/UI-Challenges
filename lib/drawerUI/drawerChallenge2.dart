import 'dart:math' as math;

import 'package:flutter/material.dart';

class DrawerChallenge2 extends StatefulWidget {
  final Widget child;

  const DrawerChallenge2({Key key, this.child}) : super(key: key);
  @override
  _DrawerChallenge2State createState() => _DrawerChallenge2State();
}

class _DrawerChallenge2State extends State<DrawerChallenge2>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  final double maxSlide = 300.0;
  bool _canBeDragged = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }



  void onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = animationController.isDismissed;
    bool isDragCloseFromRight = animationController.isCompleted;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      animationController.value += delta;
    }
  }

  void onDragEnd(DragEndDetails details) {
    //I have no idea what it means, copied from Drawer
    double _kMinFlingVelocity = 365.0;

    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }


  void close() => animationController.reverse();

  void open() => animationController.forward();

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

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
        behavior: HitTestBehavior.translucent,
        onTap: toggle,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Material(
              color: Colors.blueGrey,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(maxSlide * (animationController.value - 1), 0),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(math.pi / 2 * (1 - animationController.value)),
                      alignment: Alignment.centerRight,
                      child: MyDrawer(),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(maxSlide * animationController.value, 0),
                    child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(-math.pi / 2 * animationController.value),

                        alignment: Alignment.centerLeft,
                        child: widget.child),
                  ),
                  Positioned(
                    top: 4.0 + MediaQuery.of(context).padding.top,
                    left: 4.0 + animationController.value * maxSlide,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: toggle,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 16.0 + MediaQuery.of(context).padding.top,
                    left: animationController.value *
                        MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Hello World World',
                      style: TextStyle(color: Colors.white,fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
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
    return SizedBox(
      width: 300,
      height: double.infinity,
      child: Material(
        color: Colors.blue,
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
      ),
    );
  }
}
