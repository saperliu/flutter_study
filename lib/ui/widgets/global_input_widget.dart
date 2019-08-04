import 'package:flutter/material.dart';

/// 带图标的输入框
class GlobalInputWidget extends StatefulWidget {
  final bool obscureText;

  final String hintText;

  final TextStyle hintStyle;


  final Icon icon;

  final ValueChanged<String> onChanged;

  final TextStyle textStyle;

  final TextEditingController controller;

  final String iconImage;

  final FocusNode focusNode;
  GlobalInputWidget(
      {Key key,
      this.hintText,
      this.hintStyle,
        this.focusNode,
        this.icon,
      this.onChanged,
      this.textStyle,
      this.controller,
        this.iconImage,
      this.obscureText = false})
      : super(key: key);

  @override
  _GlobalInputWidgetState createState() => new _GlobalInputWidgetState();
}

/// State for [GlobalInputWidget] widgets.
class _GlobalInputWidgetState extends State<GlobalInputWidget> {
  _GlobalInputWidgetState() : super();

  @override
  Widget build(BuildContext context) {
    return new TextField(
      focusNode:widget.focusNode,
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      style: widget.textStyle,
      decoration: new InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.icon == null ?  new Image.asset(widget.iconImage,height: 11,width: 11,) : widget.icon ,
        border: InputBorder.none,
      ),
    );
  }
}
