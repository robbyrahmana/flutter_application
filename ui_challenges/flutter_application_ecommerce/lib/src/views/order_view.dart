import 'package:flutter/material.dart';
import 'package:flutter_application_ecommerce/app_theme.dart';
import 'package:flutter_application_ecommerce/my_flutter_app_icons.dart';
import 'package:flutter_application_ecommerce/src/models/sushi_model.dart';
import 'package:flutter_application_ecommerce/src/widgets/circle_button_widget.dart';
import 'package:flutter_application_ecommerce/src/widgets/circle_button_with_title_widget.dart';

class OrderView extends StatefulWidget {
  OrderView({this.selected});

  final SushiModel selected;

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  Offset _location;
  int priceSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: Column(
        children: [
          SizedBox(height: 27),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12, left: 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleButtonWidget(
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, right: 12),
                child: CircleButtonWidget(
                  child: Icon(Icons.favorite),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            "${widget.selected.title}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          SizedBox(height: 12),
          Text("${widget.selected.desc}"),
          SizedBox(height: 12),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleButtonWithTitle(
                  icon: MyFlutterApp.salmon,
                  title: "Salmon",
                ),
                CircleButtonWithTitle(
                  icon: MyFlutterApp.caviar,
                  title: "Caviar",
                ),
                CircleButtonWithTitle(
                  icon: MyFlutterApp.rice,
                  title: "Rice",
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/${widget.selected.image}",
            height: 200,
          ),
          SizedBox(height: 24),
          Text("Choose the quality:"),
          SizedBox(height: 12),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DrawUnit(
                        child: Text("6 units"),
                        selected: priceSelectedIndex == 0,
                        callBack: (offset) {
                          setState(() {
                            _location = offset;
                            priceSelectedIndex = 0;
                          });
                        },
                      ),
                      SizedBox(width: 24),
                      DrawUnit(
                        child: Text("12 units"),
                        selected: priceSelectedIndex == 1,
                        callBack: (offset) {
                          setState(() {
                            _location = offset;
                            priceSelectedIndex = 1;
                          });
                        },
                      ),
                      SizedBox(width: 24),
                      DrawUnit(
                        child: Text("24 units"),
                        selected: priceSelectedIndex == 2,
                        callBack: (offset) {
                          setState(() {
                            _location = offset;
                            priceSelectedIndex = 2;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                if (_location != null) buildPrice(),
                if (_location != null)
                  AnimatedPositioned(
                    left: _location.dx,
                    top: _location.dy,
                    child: Icon(
                      MyFlutterApp.sort_up,
                      color: Colors.white,
                      size: 30,
                    ),
                    duration: Duration(milliseconds: 250),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPrice() {
    return Padding(
      padding: EdgeInsets.only(
        top: _location.dy + 15, // 15 = iconsize /2
        left: 12,
        right: 12,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
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
                      color: AppTheme.darkColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text("Total Price"),
                ],
              ),
              SizedBox(width: 12),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppTheme.darkColor),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ))),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Place Order",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(width: 24),
                      Icon(
                        MyFlutterApp.purchase_order,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef TargetCallBack(Offset offset);

class DrawUnit extends StatelessWidget {
  DrawUnit({this.child, this.callBack, this.selected = false});

  final Widget child;
  final TargetCallBack callBack;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final OverlayState overlayState = Overlay.of(context);
        final RenderBox box = context.findRenderObject() as RenderBox;
        final Offset target = box.localToGlobal(
          box.size.center(Offset.zero),
          ancestor: overlayState.context.findRenderObject(),
        );
        callBack(
          Offset(target.dx - 15, box.size.height),
        );
      },
      child: child,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            selected ? AppTheme.darkColor : Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(
            !selected ? AppTheme.darkColor : Colors.white),
      ),
    );
  }
}
