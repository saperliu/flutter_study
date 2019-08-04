import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class GlobalRejectDialog extends StatefulWidget {

  final ValueChanged<String> onValueChange;
  final VoidCallback onConfirm;
  final String content;
  GlobalRejectDialog({Key key,this.content,  this.onConfirm,this.onValueChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => DialogContentState();
}

class DialogContentState extends State<GlobalRejectDialog> {

  TextEditingController textController = TextEditingController();
  String content;

  @override
  void initState() {
    super.initState();
         content = widget.content;
         LogUtil.v( widget.content,tag:"----- GlobalRejectDialog  initState---------");
         if( widget.content!="" &&  widget.content!=null) {
           textController.text =  widget.content;
         }
  }


  @override
  void dispose() {
    super.dispose();
     textController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
        type: MaterialType.transparency,
        child: ListView(
//          mainAxisAlignment: MainAxisAlignment.center,
           padding: EdgeInsets.only(left: 30,right: 30),
          children: <Widget>[
            Container(
              height: 80,
            ),
            Container(
              decoration: ShapeDecoration(
                color: Color(0xffF7F7F7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              margin: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[

                  Container(
                    constraints: BoxConstraints(minHeight: 200),
                    padding: EdgeInsets.all( 30),
                    child: TextField(

                      onChanged: ( value) {
                        widget.onValueChange(value);
                        setState(() {
                          content = value;
                        });
                      },
                      controller: textController,
                      maxLines: 9,
                      decoration:
                      InputDecoration.collapsed(hintText: "请填写驳回原因",hintStyle: TextStyle(color: Color(0xffC7CED6))),
                    ),
                  ),

                  Container(
                    color: Color(0xffe0e0e0),
                    height: 1.0,
                  ),
                  Container(
                      constraints: BoxConstraints(minHeight: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              child: Container(
//                                decoration: BoxDecoration(
//                                  border: Border(right: BorderSide(color: Color(0xffe0e0e0),width: 1))
//                                ),
                                child: Center(
                                  child: new Text(
                                    "取消",
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        color: Color(0xff475B7B)),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            color: Color(0xffe0e0e0),
                            height: 50.0,
                            width: 1,
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                child: Center(
                                  child: new Text(
                                    "确定",
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        color: Color(0xff8072f4)),
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (widget.onConfirm != null) {
                                  widget.onConfirm();
//                                  Navigator.pop(context);
                                  if(content!=null && content!="") {
                                    Navigator.of(context).pop();
                                  }
                                }
                              },
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
//      ),
    );
  }
}
