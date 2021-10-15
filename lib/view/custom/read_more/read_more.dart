import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final Color expandingButtonColor;
  final TextStyle textStyle;

  ReadMoreText(
    this.text, {
    this.expandingButtonColor,
    this.textStyle,
  });

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText>
    with TickerProviderStateMixin<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final expandingButtonColor = widget.expandingButtonColor != null
        ? widget.expandingButtonColor
        : Color(0xffE15050);
    return Column(children: <Widget>[
      AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
              constraints: isExpanded
                  ? BoxConstraints()
                  : BoxConstraints(maxHeight: 55.0 + 12.0),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Html(
                  data: widget.text,

                  style: {
                    "body": Style(textAlign: TextAlign.center),
                  },
                  // style: widget.textStyle,
                  // softWrap: true,
                  // overflow: TextOverflow.fade,
                ),
              ))),
      Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
              child: Text('${isExpanded ? 'Show less' : 'See more'}',
                  style: TextStyle(color: expandingButtonColor)),
              onPressed: () => setState(() => isExpanded = !isExpanded))
        ],
      )
    ]);
  }
}
