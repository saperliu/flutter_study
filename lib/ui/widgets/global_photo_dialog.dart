import 'package:flutter/material.dart';

class GlobalPhotoDialog extends Dialog {
//  Function onCloseEvent;
  final Function onPhotoEvent;
  final Function onCameraEvent;

  GlobalPhotoDialog({
    Key key,
    this.onPhotoEvent,
    this.onCameraEvent,
//    @required this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child:  Material(
        type: MaterialType.transparency,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
             Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              margin: const EdgeInsets.all(12.0),
              child:  Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      constraints: BoxConstraints(minHeight: 44.0),
                      child: new Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: new IntrinsicHeight(
                          child: new Text(
                            "拍照",
                            style: TextStyle(fontSize: 17.0,color: Color(0xff8072f4)),
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      this.onCameraEvent();
                    },
                  ),
                   Container(
                    color: Color(0xffe0e0e0),
                    height: 1.0,
                  ),
                  GestureDetector(
                    child: Container(
                      constraints: BoxConstraints(minHeight: 44.0),
                      child: new Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: new IntrinsicHeight(
                          child: new Text(
                            "从相册选择",
                            style: TextStyle(fontSize: 17.0,color: Color(0xff8072f4)),
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      this.onPhotoEvent();
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                decoration: ShapeDecoration(
                  color: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                width: double.infinity,
                margin: const EdgeInsets.all(12.0),
                constraints: BoxConstraints(minHeight: 44.0),
                child: new Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: new Text(
                      "取消",
                      style: TextStyle(fontSize: 16.0,color: Color(0xff666B74)),
                    ),
                  ),
                ),
              ),
              onTap: (){
//                this.onCloseEvent();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}