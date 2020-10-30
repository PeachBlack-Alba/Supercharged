import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:superPackage/ui/styles/Colors.dart';

import 'CustomMenuClipper.dart';
import 'MenuItems.dart';

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
          left: isSidebarOpenedAsync.data ? 0 : -screenWidth,
          right: isSidebarOpenedAsync.data ? 0 : screenWidth - 50.0,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  color: ColorsPalete.darkGrey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100.0,
                      ),
                      ListTile(
                        title: Text(
                          'Missy Elliot',
                          style: TextStyle(
                            color: ColorsPalete.lightGrey,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        subtitle: Text(
                          'queenOfThe90s@gmail.com',
                          style: TextStyle(
                            color: ColorsPalete.lightGrey,
                            fontSize: 18.0,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: ColorsPalete.lightGrey,
                          child: Icon(Icons.perm_identity, color: Colors.white),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: ColorsPalete.lightGrey,
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: 'Home',
                      ),
                      MenuItem(
                        icon: Icons.person,
                        title: 'My Accounts',
                      ),
                      MenuItem(
                        icon: Icons.analytics,
                        title: 'Sollar',
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: ColorsPalete.lightGrey,
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: 'Settings',
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: 'Logout',
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
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
