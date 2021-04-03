import 'package:flutter/material.dart';
import 'package:flutter_application_ecommerce/app_theme.dart';
import 'package:flutter_application_ecommerce/src/models/sushi_model.dart';
import 'package:flutter_application_ecommerce/src/views/order_view.dart';

class HomeTopSushiView extends StatelessWidget {
  final List<SushiModel> list = SushiModel.list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        bool flag = index % 2 == 0;
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderView(
                          selected: list[index],
                        )));
          },
          child: Container(
            width: 200,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: flag ? AppTheme.darkColor : Colors.white,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/${list[index].image}"),
                    Expanded(child: SizedBox.shrink()),
                    Text(
                      "${list[index].title}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: !flag ? AppTheme.darkColor : Colors.white,
                      ),
                    ),
                    Text(
                      "${list[index].desc}",
                      style: TextStyle(
                        color: !flag
                            ? AppTheme.darkColor.withAlpha(100)
                            : Colors.white.withAlpha(100),
                      ),
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(text: "\$", children: [
                            TextSpan(
                              text: "6.00",
                              style: TextStyle(fontSize: 24),
                            ),
                          ]),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: !flag ? AppTheme.darkColor : Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(!flag
                                        ? AppTheme.darkColor
                                        : Colors.white.withAlpha(100)),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ))),
                            onPressed: () {},
                            child: Text(
                              "Order",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
