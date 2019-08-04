import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/ui/widgets/dropdown/dropdown_item.dart';

class GlobalHangUpDialog extends StatefulWidget {

  final ValueChanged<String> onValueChange;
  final ValueChanged<String> onHangUpTypeChange;
  final VoidCallback onConfirm;
  final String content;
  final String hangUpType;
  final List<Map<String, dynamic>>  hangUpList;

  GlobalHangUpDialog({Key key,this.content, this.hangUpType,this.hangUpList, this.onConfirm,this.onValueChange,this.onHangUpTypeChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => DialogContentState();
}

class DialogContentState extends State<GlobalHangUpDialog> {

  TextEditingController textController = TextEditingController();
  String content;
   String hangUpType;
   List<Map<String, dynamic>>  hangUpList;
  @override
  void initState() {
    super.initState();
    content = widget.content;
    hangUpType = widget.hangUpType;
    hangUpList = widget.hangUpList;

    LogUtil.v( hangUpList,tag:"----- GlobalHangUpDialog  hangUpList---------");
    LogUtil.v( widget.content,tag:"----- GlobalHangUpDialog  initState---------");
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

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                  Align(
                     alignment:Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only( left: 30),
                      child: DropDownFormField(
                        hintText: '请选择挂起类型',
                        value: hangUpType,
                        onSaved: (value) {},
                        onChanged: (value) {
                          if(widget.onHangUpTypeChange!=null){
                            widget.onHangUpTypeChange(value);
                          }
                          setState(() {
                            hangUpType = value;
                          });
                        },
                        dataSource: hangUpList ?? [],
                        textField: 'description',
                        valueField: 'value',
                      ),
                    )
                  ),


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
                      InputDecoration.collapsed(hintText: "请填写备注",hintStyle: TextStyle(color: Color(0xffC7CED6))),
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
      ),
    );
  }
}
