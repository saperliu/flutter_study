import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchInputWidget extends StatefulWidget {
  final double height;
  final double elevation; //阴影
  final String hintText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final IconData prefixIcon;
  final List<TextInputFormatter> inputFormatters;
  final VoidCallback onEditingComplete;
  final VoidCallback onFocus;
  final  ValueChanged<String> onChangeValue;

  const SearchInputWidget(
      {Key key,
      this.height: 46.0,
      this.elevation: 0.5,
      this.hintText: '搜索',
      this.focusNode,
      this.controller,
      this.inputFormatters,
      this.onEditingComplete,
      this.onChangeValue,
      this.onFocus,
      this.prefixIcon: Icons.search})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return new SearchInputState();
  }
}

class SearchInputState extends State<SearchInputWidget> {
  bool _hasdeleteIcon = false;

  FocusNode _focusNode = FocusNode();
  @override
  void initState() {

    _focusNode.addListener(() {
      LogUtil.v("---_focusNode----addListener----------");
      if (_focusNode.hasFocus) {
        // TextField has lost focus
         widget.onFocus();
      }else{
//        widget.onFocus();
      }
    });
    super.initState();

//    var widgetsBinding=WidgetsBinding.instance;
//    widgetsBinding.addPostFrameCallback((callback){
//      widgetsBinding.addPersistentFrameCallback((callback){
//        print("addPersistentFrameCallback be invoke");
//        //触发一帧的绘制
//        widget.onFocus();
//        widgetsBinding.scheduleFrame();
//      });
//    });

  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    LogUtil.v(_focusNode.hasFocus,tag:"---_focusNode----BuildContext----------");
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
//          border: new Border.all(color: Color(0xffffffff), width: 0), // 边色与边宽度
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(10)),
//          boxShadow: [
//            BoxShadow(
//              color: Color(0xff626C91),
//              blurRadius: 5,
////              spreadRadius: 1.0,
//            )
//          ],
        ),
        child: new TextField(
            focusNode: _focusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: widget.controller,
            maxLines: 1,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Color(0xff929CA6),
                fontSize: 16.5,
              ),
              prefixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 14.0),
                  child: Icon(
                    widget.prefixIcon,
                    color: Color(0xff929CA6),
                  )),
              suffixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 2.0, end: _hasdeleteIcon ? 20.0 : 0),
                  child: _hasdeleteIcon
                      ? new InkWell(
                          onTap: (() {
                            setState(() {
                              widget.controller.text = '';
                              _hasdeleteIcon = false;
                            });
                            ///清空输入框的内容，
                            ///回调值的改变
                            widget.onChangeValue("");
                            widget.onEditingComplete();
                          }),
                          child: Icon(
                            Icons.clear,
                            size: 18.0,
                            color: Colors.black,
                          ))
                      : new Text('')),
              contentPadding: EdgeInsets.fromLTRB(40, 6, 0, 0),
              filled: true,
              fillColor: Colors.transparent,
              border: InputBorder.none,
            ),
            onChanged: (str) {
              setState(() {
                if (str.isEmpty) {
                  _hasdeleteIcon = false;
                } else {
                  _hasdeleteIcon = true;
                }
              });
              widget.onChangeValue(str);
            },
            onEditingComplete: widget.onEditingComplete,
        )
    );
  }
}
