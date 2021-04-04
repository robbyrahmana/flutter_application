import 'package:flutter/material.dart';
import 'package:freelancer_profile/app_icon.dart';
import 'package:freelancer_profile/src/pages/profile_page.dart';
import 'package:freelancer_profile/src/widgets/pict_grid_widget.dart';
import 'package:freelancer_profile/themes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            AppIcon.menu,
            color: Colors.black38,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ProfilePage()));
              },
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/usr1.jpg"),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Text.rich(
              TextSpan(
                text: "Find",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: " iOS Developers",
                    style: TextStyle(color: Themes.textColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            _buildHeader(context),
            _buildSearch(),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured Developers",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "View More",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Themes.textColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            GridView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16),
              children: [
                PictGridWidget(
                  "assets/usr1.jpg",
                  "Shane West",
                ),
                PictGridWidget(
                  "assets/usr2.jpg",
                  "Shane West",
                ),
                PictGridWidget(
                  "assets/usr3.jpg",
                  "Shane West",
                ),
                PictGridWidget(
                  "assets/usr4.jpg",
                  "Shane West",
                )
              ],
            ),
            SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg2.jpg"),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tips to hire right person",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Why you need on iOS developers and what you will get from hired contractor.",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search by skills...",
        hintStyle: TextStyle(
          color: Colors.black54,
          fontStyle: FontStyle.italic,
        ),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.black54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.black38),
          gapPadding: 1,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            "assets/bg.png",
            height: 150,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width * .6,
                child: Text(
                  "Why you need on iOS developers and what you will get from hired contractor.",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                child: Text(
                  "About Position",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Themes.textColor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    )),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
