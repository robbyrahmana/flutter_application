import 'package:flutter/material.dart';

class AppOutlineButton extends StatelessWidget {
  final String asset;
  final VoidCallback onTap;

  AppOutlineButton({@required this.asset, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Image.asset(
          asset,
          height: 24,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      borderSide: BorderSide(color: Colors.black12),
      onPressed: onTap,
    );
  }
}
