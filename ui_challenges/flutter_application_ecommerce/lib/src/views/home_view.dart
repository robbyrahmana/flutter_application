import 'package:flutter/material.dart';
import 'package:flutter_application_ecommerce/app_theme.dart';
import 'package:flutter_application_ecommerce/my_flutter_app_icons.dart';
import 'package:flutter_application_ecommerce/src/views/home_top_sushi_view.dart';
import 'package:flutter_application_ecommerce/src/widgets/circle_button_widget.dart';
import 'package:flutter_application_ecommerce/src/widgets/circle_button_with_title_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 27),
          Padding(
            padding: EdgeInsets.only(top: 12, left: 12),
            child: CircleButtonWidget(
              child: Icon(Icons.menu),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "👋 Hi, Angle!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "What is your favorite sushi?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                buildSearch(),
                SizedBox(height: 12),
                buildHeader("Categories", () {}),
                SizedBox(height: 12),
                buildCategories(),
                SizedBox(height: 32),
                buildHeader("Top Sushi", () {}),
                SizedBox(height: 12),
                SizedBox(
                  height: 300,
                  child: HomeTopSushiView(),
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader(String title, VoidCallback onSeeAllTap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          InkWell(
            child: Text("See all"),
            onTap: onSeeAllTap,
          ),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search your sushi",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget buildCategories() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButtonWithTitle(icon: MyFlutterApp.salmon, title: "Salmon"),
          CircleButtonWithTitle(icon: MyFlutterApp.caviar, title: "Caviar"),
          CircleButtonWithTitle(icon: MyFlutterApp.rice, title: "Rice"),
          CircleButtonWithTitle(icon: MyFlutterApp.tentacles, title: "Octopus"),
          CircleButtonWithTitle(icon: MyFlutterApp.prawn, title: "Shrimp"),
        ],
      ),
    );
  }
}
