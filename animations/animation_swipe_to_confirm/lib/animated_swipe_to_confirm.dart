import 'package:flutter/material.dart';

class AnimatedSwipeToConfirm extends StatefulWidget {
  const AnimatedSwipeToConfirm({
    Key? key,
    this.height = 60,
    this.borderWidth = 3,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  final double? height;
  final double? borderWidth;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  _AnimatedSwipeToConfirmState createState() => _AnimatedSwipeToConfirmState();
}

class _AnimatedSwipeToConfirmState extends State<AnimatedSwipeToConfirm> {
  late double _maxWidth;
  late double _handleSize;
  double _dragValue = 0;
  double _dragWidth = 0;
  bool _confirmed = false;
  @override
  Widget build(BuildContext context) {
    _handleSize = (widget.height! - (widget.borderWidth! * 2));
    return LayoutBuilder(builder: (context, constraint) {
      _maxWidth = constraint.maxWidth;
      return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: widget.height,
        decoration: BoxDecoration(
          color: _confirmed ? Colors.white : Colors.greenAccent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: _confirmed ? Colors.white : Colors.greenAccent,
            width: widget.borderWidth!,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Text(
                  _confirmed ? "Confirmed" : "Swipe to confirm",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: _confirmed ? Colors.black54 : Colors.white,
                      ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: _dragWidth <= _handleSize ? _handleSize : _dragWidth,
                child: Row(
                  children: [
                    Expanded(child: SizedBox.shrink()),
                    GestureDetector(
                      onVerticalDragUpdate: _onDragUpdate,
                      onVerticalDragEnd: _onDragEnd,
                      child: Container(
                        width: _handleSize,
                        height: _handleSize,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragValue = (details.globalPosition.dx) / _maxWidth;
      _dragWidth = _maxWidth * _dragValue;
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (_dragValue > .9) {
      _dragValue = 1;
    } else {
      _dragValue = 0;
    }

    setState(() {
      _dragWidth = _maxWidth * _dragValue;
      _confirmed = _dragValue == 1;
    });

    if (_dragValue == 1) {
      widget.onConfirm();
    } else {
      widget.onCancel();
    }
  }
}
