import 'package:flutter/material.dart';
import 'dart:math';

class MainAppBar extends StatefulWidget {
  final double opacity;
  MainAppBar(this.opacity);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  final List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedOpacity(
            // If the widget is visible, animate to 0.0 (invisible).
            // If the widget is hidden, animate to 1.0 (fully visible).
            opacity: min(1.0, 0.2 + (widget.opacity * widget.opacity)),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            // The green box must be a child of the AnimatedOpacity widget.
            child: Container(
              color: Colors.black,
            ),
          ),
        ),
        Container(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  AnimatedOpacity(
                    // If the widget is visible, animate to 0.0 (invisible).
                    // If the widget is hidden, animate to 1.0 (fully visible).
                    opacity: widget.opacity == 1 ? 1.0 : 0.0,
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 500),
                    // The green box must be a child of the AnimatedOpacity widget.
                    child: Text(
                      'Szoveg1 - beta',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              _isHovering[0] = value;
                            });
                          },
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Discover',
                                style: TextStyle(
                                  color: _isHovering[0]
                                      ? Colors.blue[200]
                                      : Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Visibility(
                                  maintainAnimation: true,
                                  maintainSize: true,
                                  maintainState: true,
                                  visible: _isHovering[0],
                                  child: Container(
                                    height: 2,
                                    width: 20,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(width: screenSize.width / 20),
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              _isHovering[1] = value;
                            });
                          },
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Contact Us',
                                style: TextStyle(
                                    color: _isHovering[1]
                                        ? Colors.blue[100]
                                        : Colors.white),
                              ),
                              SizedBox(height: 5),
                              Visibility(
                                  maintainAnimation: true,
                                  maintainSize: true,
                                  maintainState: true,
                                  visible: _isHovering[1],
                                  child: Container(
                                    height: 2,
                                    width: 20,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        _isHovering[2] = value;
                      });
                    },
                    onTap: () {},
                    child: Text(
                      'Szoveg2 Up',
                      style: TextStyle(
                          color:
                              _isHovering[2] ? Colors.blue[100] : Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width / 50,
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        _isHovering[3] = value;
                      });
                    },
                    onTap: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color:
                              _isHovering[3] ? Colors.blue[100] : Colors.white),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
