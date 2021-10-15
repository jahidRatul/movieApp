library bottom_navigation_dot;

import 'package:flutter/material.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';

class BottomNavigationDot extends StatefulWidget {
  final List<BottomNavigationDotItem> items;
  final Color activeColor;
  final Color color;
  final Color backgroundColor;
  final double paddingBottomCircle;
  final int milliseconds;
  int indexSelected;

  BottomNavigationDot(
      {@required this.items,
      this.activeColor,
      this.color,
      this.backgroundColor,
      this.paddingBottomCircle,
      this.indexSelected = 0,
      @required this.milliseconds,
      Key key})
      //: assert(indexSelected > items.length),
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationDotState();
}

class _BottomNavigationDotState extends State<BottomNavigationDot> {
  GlobalKey _key = GlobalKey();
  double _numPositionBase, _numDifferenceBase, _positionLeftIndicatorDot = 0;
  int _indexSelected = 0;
  Color _color, _activeColor;

  @override
  void initState() {
    this._indexSelected = widget.indexSelected;
    WidgetsBinding.instance.addPostFrameCallback(_afterPage);
    // _changeOptionBottomBar(_indexSelected);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        //  height: 100,
        child: Material(
            child: Container(
          decoration: BoxDecoration(color: widget.backgroundColor, boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
                color: AppColors.ShadowRed)
          ]),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Stack(
            key: _key,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: widget.paddingBottomCircle),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        _createNavigationIconButtonList(widget.items.asMap())),
              ),
              AnimatedPositioned(
                child: Container(height: 2, width: 12, color: _activeColor),
                duration: Duration(milliseconds: widget.milliseconds),
                curve: Curves.easeInOut,
                left: _positionLeftIndicatorDot - 4,
                bottom: 0,
              ),
            ],
          ),
        )),
      );

  List<Widget> _createNavigationIconButtonList(
      Map<int, BottomNavigationDotItem> mapItem) {
    List<Widget> children = List<Widget>();
    mapItem.forEach(
      (index, item) => children.add(
        Expanded(
          child: _NavigationIconButton(
            item.icon,
            (index == _indexSelected) ? _activeColor : _color,
            item.iconSize,
            item.onTap,
            () {
              _changeOptionBottomBar(index);
            },
          ),
        ),
      ),
    );
    return children;
  }

  void _changeOptionBottomBar(int indexSelected) {
    if (indexSelected != _indexSelected) {
      setState(() {
        _positionLeftIndicatorDot =
            (_numPositionBase * (indexSelected + 1)) - _numDifferenceBase;
      });
      _indexSelected = indexSelected;
      print("_positionLeftIndicatorDot $_positionLeftIndicatorDot");
    }
  }

  _afterPage(_) {
    _color = widget.color ?? Colors.black45;
    _activeColor = widget.activeColor ?? Theme.of(context).primaryColor;
    final sizeBottomBar =
        (_key.currentContext.findRenderObject() as RenderBox).size;
    _numPositionBase = ((sizeBottomBar.width / widget.items.length));
    _numDifferenceBase = (_numPositionBase - (_numPositionBase / 2) + 2);
    setState(() {
      _positionLeftIndicatorDot = _numPositionBase - _numDifferenceBase;
    });
    print("_positionLeftIndicatorDot $_positionLeftIndicatorDot");
    setState(() {
      _positionLeftIndicatorDot =
          (_numPositionBase * (_indexSelected + 1)) - _numDifferenceBase;
    });
  }
}

class BottomNavigationDotItem {
  final IconData icon;
  final double iconSize;
  final NavigationIconButtonTapCallback onTap;

  const BottomNavigationDotItem(
      {@required this.icon, this.iconSize, this.onTap})
      : assert(icon != null);
}

typedef NavigationIconButtonTapCallback = void Function();

class _NavigationIconButton extends StatefulWidget {
  final IconData _icon;
  final Color _colorIcon;
  final double _iconSize;
  final NavigationIconButtonTapCallback _onTapInternalButton;
  final NavigationIconButtonTapCallback _onTapExternalButton;

  const _NavigationIconButton(this._icon, this._colorIcon, this._iconSize,
      this._onTapInternalButton, this._onTapExternalButton,
      {Key key})
      : super(key: key);

  @override
  _NavigationIconButtonState createState() => _NavigationIconButtonState();
}

class _NavigationIconButtonState extends State<_NavigationIconButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _sAnimation;
  double _opacityIcon = 1;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _sAnimation = Tween<double>(begin: 1, end: 0.93).animate(_controller);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown: (_) {
          _controller.forward();
          setState(() {
            _opacityIcon = 0.7;
          });
        },
        onTapUp: (_) {
          _controller.reverse();
          setState(() {
            _opacityIcon = 1;
          });
        },
        onTapCancel: () {
          _controller.reverse();
          setState(() {
            _opacityIcon = 1;
          });
        },
        onTap: () {
          widget._onTapInternalButton();
          widget._onTapExternalButton();
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 15, right: 15, top: 0),
          child: ScaleTransition(
            scale: _sAnimation,
            child: AnimatedOpacity(
              opacity: _opacityIcon,
              duration: Duration(milliseconds: 200),
              child: Icon(
                widget._icon,
                color: widget._colorIcon,
                size: widget._iconSize,
              ),
            ),
          ),
        ),
      );
}
