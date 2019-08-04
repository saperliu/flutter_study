import 'package:flutter/material.dart';

class GlobalShortcutDialog extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  final ValueChanged<String> onSelect;
  final VoidCallback onConfirm;

  GlobalShortcutDialog({Key key, this.data, this.onConfirm, this.onSelect})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => DialogContentState();
}

class DialogContentState extends State<GlobalShortcutDialog> {
  List<Map<String, dynamic>> data = List();
  Map<String, bool> dataSelect = Map();

  @override
  void initState() {
    super.initState();
    data = widget.data;
    dataSelect = Map();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
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
                  if (widget.data != null)
                      ...widget.data
                          .map(
                            (obj) => GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20, bottom: 20),

                                    constraints: BoxConstraints(
                                        minHeight: 44.0, maxWidth: 165),
                                    decoration: BoxDecoration(
                                      color: dataSelect[obj["id"]]??false
                                          ? Color(0xff8673F7)
                                          : Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: new IntrinsicHeight(
                                        child: new Text(
                                          obj["name"],
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: dataSelect[obj["id"]]??false
                                                ? Color(0xffffffff)
                                                : Color(0xff3B424E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    //选择的事件
                                    if(widget.onSelect!=null) {
                                        widget.onSelect(obj["id"]);
                                    }
                                    setState(() {
                                      dataSelect[obj["id"]] = true;
                                    });
                                  },
                                ),
                          )
                          .toList(),

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
                                if(widget.onConfirm!=null){
                                   widget.onConfirm();
                                   Navigator.pop(context);
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
