import 'package:flutter/material.dart';

class RoundBoarderButton extends StatefulWidget {
  RoundBoarderButton(
      {@required this.text,
      this.onPress,
      this.backGroundColor,
      this.borderRadius = 8.0,
      this.textColor,
      this.margin,
      @required this.padding});

  final text;
  final Function onPress;
  final Color backGroundColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets margin;
  final double padding;

  @override
  _RoundBoarderButtonState createState() => _RoundBoarderButtonState();
}

class _RoundBoarderButtonState extends State<RoundBoarderButton> {
  var defaultBorderRadius = 8.0;

  final textStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ??
          EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
      child: Align(
        alignment: Alignment.center,
        child: RaisedButton(
          elevation: 10.0,
          padding: EdgeInsets.symmetric(vertical: widget.padding),
          color: widget.backGroundColor != null
              ? widget.backGroundColor
              : Color(0xFFE15050),
          disabledColor: Colors.grey,
          disabledElevation: 2,
          onPressed: widget.onPress,
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${widget.text}',
                    textAlign: TextAlign.center,
                    style: textStyle.copyWith(
                        color: widget.textColor != null
                            ? widget.textColor
                            : Colors.white,
                        fontFamily: 'poppins_bold',
                        fontSize: 15.0),
                  )),
            ],
          ),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius != null
                ? widget.borderRadius
                : defaultBorderRadius),
            borderSide: BorderSide(
              color: widget.backGroundColor != null
                  ? widget.backGroundColor
                  : Color(0xFFE15050),
              style: widget.backGroundColor != null
                  ? BorderStyle.solid
                  : BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}
