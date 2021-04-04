import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_profile/app_icon.dart';
import 'package:freelancer_profile/themes.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 350,
            child: Stack(
              children: [
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg1.jpg"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .2,
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            AppIcon.print,
                            color: Colors.black45,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            AppIcon.gift,
                            color: Colors.purple,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50, right: 30),
                    child: _buildInfo(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Text(
                            "Contract",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        "As of date 13.02.2021",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          _buildTaskList(),
          _buildBudget(),
          Padding(
            padding: EdgeInsets.all(12),
            child: FlatButton(
              onPressed: () {},
              color: Themes.textColor.withAlpha(100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    AppIcon.paperclip,
                    color: Themes.textColor,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Upload Invoice",
                    style: TextStyle(color: Themes.textColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _buildBudget() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Budget",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$8,950",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
          Text(
            "Patrick Barker",
            style: TextStyle(fontSize: 32, fontFamily: "DancingScript"),
          ),
        ],
      ),
    );
  }

  Padding _buildTaskList() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Main Tasks List",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            "- Design and implement smartphone application",
            style: TextStyle(color: Colors.black45, height: 1.5),
          ),
          Text(
            "- Maintain app development tools",
            style: TextStyle(color: Colors.black45, height: 1.5),
          ),
          Text(
            "- Resolve reported bug",
            style: TextStyle(color: Colors.black45, height: 1.5),
          ),
          Text(
            "- Participate in end-to-end system integration test",
            style: TextStyle(color: Colors.black45, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Themes.bg1,
              Themes.bg2,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 24,
              offset: Offset(1, 5),
              color: Colors.black54,
            ),
          ]),
      child: Container(
        width: MediaQuery.of(context).size.width * .6,
        height: 180,
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DEW Project",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/usr1.jpg"),
                ),
              ],
            ),
            Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.white, height: 1.5),
                text:
                    "Patrick Barker just sent you a contract with all detailed information.",
                children: [
                  TextSpan(
                    text: " Sign here",
                    style: TextStyle(color: Themes.textColor),
                    recognizer: TapGestureRecognizer(),
                  ),
                  TextSpan(text: " and attach an invoice to send back."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
