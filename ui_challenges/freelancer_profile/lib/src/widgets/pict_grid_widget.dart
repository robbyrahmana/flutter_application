import 'package:flutter/material.dart';

class PictGridWidget extends StatelessWidget {
  final String asset;
  final String name;
  PictGridWidget(this.asset, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
