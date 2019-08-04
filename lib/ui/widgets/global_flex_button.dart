import 'package:flutter/material.dart';


/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-04-08 18:10
 * @Description  按钮
 */
class GlobalFlexButton extends StatelessWidget {
  final String text;

  final Color color;

  final Color textColor;

  final VoidCallback onPress;

  final double fontSize;
  final int maxLines;

  final MainAxisAlignment mainAxisAlignment;

  GlobalFlexButton(
      {Key key, this.text, this.color, this.textColor, this.onPress, this.fontSize = 20.0, this.mainAxisAlignment = MainAxisAlignment.center, this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        padding: new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
        textColor: textColor,
        color: color,
        child: new Flex(
          mainAxisAlignment: mainAxisAlignment,
          direction: Axis.horizontal,
          children: <Widget>[new Text(text, style: new TextStyle(fontSize: fontSize), maxLines: maxLines, overflow:TextOverflow.ellipsis)],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
//            side: BorderSide(color: Color(0xFFFFF00F), style: BorderStyle.solid, width: 2)
       ),
        onPressed: () {
          this.onPress?.call();
        });
  }
}
