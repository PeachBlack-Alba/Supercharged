import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:superPackage/ui/styles/Colors.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  // value of the Stream
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    //initialisation
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      // if animation is not completed run forward
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false, // so that way is closed by default
      stream: isSidebarOpenedStream,
      builder: (context, isSidebarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSidebarOpenedAsync.data ? 0 : 0,
          right: isSidebarOpenedAsync.data ? 0 : screenWidth - 50.0,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: ColorsPalete.darkGrey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100.0,
                      ),
                      Column(
                        children: [
                          Text(
                              'Missy Elliot',
                              style: TextStyle(
                                color: ColorsPalete.lightGrey,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                             Text(
                              'queenOfThe90s@gmail.com',
                              style: TextStyle(
                                color: ColorsPalete.lightGrey,
                                fontSize: 20.0,
                              ),
                            ),
                             CircleAvatar(
                              radius: 40.0,
                              backgroundImage:
                                  AssetImage('assets/images/missy.png'),
                              backgroundColor: Colors.transparent,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: Container(
                    height: 110.0,
                    width: 35.0,
                    color: ColorsPalete.darkGrey,
                    alignment: Alignment.centerLeft,
                    child: AnimatedIcon(
                      progress: _animationController.view,
                      icon: AnimatedIcons.menu_close,
                      color: ColorsPalete.lightGrey,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
