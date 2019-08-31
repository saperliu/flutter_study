import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WorkItemState state, Dispatch dispatch, ViewService viewService) {
  return Container(
//    padding: const EdgeInsets.all(8.0),
    margin: EdgeInsets.only(top: 6),
    child: GestureDetector(
      child: Card(
        child: Container(
          //此容器是为了红左侧的红边
          padding: EdgeInsets.fromLTRB(0, 17, 0, 15),
          height: 78,
          child: Container(
            height: 36,
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: Color(state.statusColor), width: 2))),
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 0, 14, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(state.workOrderNum,style: TextStyle(color: Color(0xff3B424E),fontSize: 17,fontWeight: FontWeight.w500),),
                          Text(state.createDate,style: TextStyle(color: Color(0xff929CA6),fontSize: 11,fontWeight: FontWeight.w300),),
                        ],
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    ///
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(state.description,softWrap: false,overflow: TextOverflow.ellipsis,style: TextStyle(color: Color(0xff666B74),fontSize: 13,fontWeight: FontWeight.w300),),
                            flex: 8,
                          ),
                          Expanded(
                            child:Container(
                              child:Text(state.statusName,textAlign: TextAlign.right,style: TextStyle(color: Color(state.statusColor)),),
                            ),
                            flex: 3,
                          )

                        ],
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        //可以跳转去详情
      },
    ),
  );
}
