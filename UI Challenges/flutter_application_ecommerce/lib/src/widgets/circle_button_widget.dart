import 'package:flutter/material.dart';

class CircleButtonWidget extends StatelessWidget {
  CircleButtonWidget({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      padding: EdgeInsets.all(12),
      child: child,
    );
  }
}
