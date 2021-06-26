import 'package:animation_swipe_to_confirm/animated_swipe_to_confirm.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "Please subscribe";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlutterLogo(
              size: 100,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: AnimatedSwipeToConfirm(
                onConfirm: () {
                  setState(() {
                    text = "Thank you :)";
                  });
                },
                onCancel: () {
                  setState(() {
                    text = "Please subscribe";
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
