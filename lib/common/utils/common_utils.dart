import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_study/ui/widgets/global_flex_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:zoomable_image/zoomable_image.dart';

/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-04-08 18:10
 * @Description  工具类
 */
class CommonUtils {
  static final double MILLIS_LIMIT = 1000.0;

  static final double SECONDS_LIMIT = 60 * MILLIS_LIMIT;

  static final double MINUTES_LIMIT = 60 * SECONDS_LIMIT;

  static final double HOURS_LIMIT = 24 * MINUTES_LIMIT;

  static final double DAYS_LIMIT = 30 * HOURS_LIMIT;

  static double sStaticBarHeight = 0.0;

  static String getDateStr(DateTime date) {
    if (date == null || date.toString() == null) {
      return "";
    } else if (date.toString().length < 10) {
      return date.toString();
    }
    return date.toString().substring(0, 10);
  }

  ///日期格式转换
  static String getNewsTimeStr(DateTime date) {
    int subTime =
        DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;

    if (subTime < MILLIS_LIMIT) {
      return "刚刚";
    } else if (subTime < SECONDS_LIMIT) {
      return (subTime / MILLIS_LIMIT).round().toString() + " 秒前";
    } else if (subTime < MINUTES_LIMIT) {
      return (subTime / SECONDS_LIMIT).round().toString() + " 分钟前";
    } else if (subTime < HOURS_LIMIT) {
      return (subTime / MINUTES_LIMIT).round().toString() + " 小时前";
    } else if (subTime < DAYS_LIMIT) {
      return (subTime / HOURS_LIMIT).round().toString() + " 天前";
    } else {
      return getDateStr(date);
    }
  }

  ///得到月份的最后一天
  static int getLastDay(int year,int month) {
    if(month==2){
      if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0){
          return 29;
      }else{
        return 28;
      }
    }
    if(month ==1 || month ==3 ||month ==5||month ==7|| month ==8 || month ==10||month ==12 ){
      return 31;
    }else{
      return 30;
    }
  }

  static DateTime getDateTimeByStr(String date) {
      List list = date.split(" ");
      if(list.length==2) {
        String ymd = list[0];
        String hms = list[1];
        
        List ymdList = ymd.split("/");
        List hmsList = hms.split(":");
        
        return DateTime(int.parse(ymdList[0]),int.parse(ymdList[1]),int.parse(ymdList[2]),int.parse(hmsList[0]),int.parse(hmsList[1]),int.parse(hmsList[2]));
        
      }else{
        throw FormatException('date format error!');
      }
  }

  ///List转为字符串
  static String getStringByList(List<String> list) {
    String data = "";
    if (list != null) {
      for (String temp in list) {
        if (data == "") {
          data = temp;
        } else {
          data = data + "," + temp;
        }
      }
    }
    return data;
  }

  static getLocalPath() async {
    Directory appDir;
    if (Platform.isIOS) {
      appDir = await getApplicationDocumentsDirectory();
    } else {
      appDir = await getExternalStorageDirectory();
    }
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.storage]);
      if (permissions[PermissionGroup.storage] != PermissionStatus.granted) {
        return null;
      }
    }
    String appDocPath = appDir.path + "/flutterstudy/";
    Directory appPath = Directory(appDocPath);
    await appPath.create(recursive: true);
    return appPath;
  }

  static saveImage(String url) async {
    Future<String> _findPath(String imageUrl) async {
      final file = await DefaultCacheManager().getSingleFile(url);
      LogUtil.v(file, tag: "------------_loadImage------------");
      if (file == null) {
        return null;
      }
      Directory localPath = await CommonUtils.getLocalPath();
      if (localPath == null) {
        return null;
      }
      final name = splitFileNameByPath(file.path);
      final result = await file.copy(localPath.path + name);
      return result.path;
    }

    return _findPath(url);
  }

  static splitFileNameByPath(String path) {
    return path.substring(path.lastIndexOf("/"));
  }

  static getFullName(String repository_url) {
    if (repository_url != null &&
        repository_url.substring(repository_url.length - 1) == "/") {
      repository_url = repository_url.substring(0, repository_url.length - 1);
    }
    String fullName = '';
    if (repository_url != null) {
      List<String> splicurl = repository_url.split("/");
      if (splicurl.length > 2) {
        fullName =
            splicurl[splicurl.length - 2] + "/" + splicurl[splicurl.length - 1];
      }
    }
    return fullName;
  }

  static getLocalAppDataPath() async {
    Directory appDir;

      appDir = await getApplicationDocumentsDirectory();

    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
      await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      if (permissions[PermissionGroup.storage] != PermissionStatus.granted) {
        return null;
      }
    }
    String appDocPath = appDir.path + "/flutterstudy/";
    Directory appPath = Directory(appDocPath);
    await appPath.create(recursive: true);
    return appPath;
  }




  static const IMAGE_END = [".png", ".jpg", ".jpeg", ".gif", ".svg"];

  static isImageEnd(path) {
    bool image = false;
    for (String item in IMAGE_END) {
      if (path.indexOf(item) + item.length == path.length) {
        image = true;
      }
    }
    return image;
  }

  static copy(String data, BuildContext context) {
    Clipboard.setData(new ClipboardData(text: data));
    Fluttertoast.showToast(
        msg: "已经复制到粘贴板");
  }

  ///保存图片到相册
  static saveImageGallery(String url, bool isNetUrl) async {
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage,
    ]); // 在这里添加需要的权限
    var imageData;
    if (isNetUrl) {
      final file = await DefaultCacheManager().getSingleFile(url);
      LogUtil.v(file, tag: "------------_loadImage------------");
      if (file == null) {
        return null;
      }
      imageData = await rootBundle.load(file.path).then((byteData) {
        return byteData.buffer.asUint8List();
      });
    } else {
      imageData = await rootBundle.load(url).then((byteData) {
        return byteData.buffer.asUint8List();
      });
    }

    final result = await ImageGallerySaver.save(imageData); //这个是核心的保存图片的插件

//   //这个返回值 在保存成功后会返回true
    if (result) {
      Fluttertoast.showToast(
        msg: '保存成功',
        fontSize: 14,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: '保存失败',
        fontSize: 14,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        textColor: Colors.white,
      );
    }
  }

  static Map<String, dynamic> deleteNullData(Map<String, dynamic> data) {
    //删除所有值是空的数据
    List<String> keys = List();
    //查询数据为空的key
    data.keys.forEach((f) {
      if (data[f] == null || data[f] == "") {
        keys.add(f);
      }
    });
    //删除key
    for (String key in keys) {
      data.remove(key);
    }
    return data;
  }

//  static launchUrl(context, String url) {
//    if (url == null && url.length == 0) return;
//    Uri parseUrl = Uri.parse(url);
//    bool isImage = isImageEnd(parseUrl.toString());
//    if (parseUrl.toString().endsWith("?raw=true")) {
//      isImage = isImageEnd(parseUrl.toString().replaceAll("?raw=true", ""));
//    }
//    if (isImage) {
//      NavigatorUtils.gotoPhotoViewPage(context, url);
//      return;
//    }
//
//    if (parseUrl != null && parseUrl.host == "github.com" && parseUrl.path.length > 0) {
//      List<String> pathnames = parseUrl.path.split("/");
//      if (pathnames.length == 2) {
//        //解析人
//        String userName = pathnames[1];
//        NavigatorUtils.goPerson(context, userName);
//      } else if (pathnames.length >= 3) {
//        String userName = pathnames[1];
//        String repoName = pathnames[2];
//        //解析仓库
//        if (pathnames.length == 3) {
//          NavigatorUtils.goReposDetail(context, userName, repoName);
//        } else {
//          launchWebView(context, "", url);
//        }
//      }
//    } else if (url != null && url.startsWith("http")) {
//      launchWebView(context, "", url);
//    }
//  }

//  static void launchWebView(BuildContext context, String title, String url) {
//    if (url.startsWith("http")) {
//      NavigatorUtils.goPerfectWebView(context, url, title);
//    } else {
//      NavigatorUtils.goPerfectWebView(
//          context, new Uri.dataFromString(url, mimeType: 'text/html', encoding: Encoding.getByName("utf-8")).toString(), title);
//    }
//  }

  static launchOutURL(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(
          msg: "url异常" +
              ": " +
              url);
    }
  }

  static Future<Null> showEditDialog(
    BuildContext context,
    String dialogTitle,
    ValueChanged<String> onTitleChanged,
    ValueChanged<String> onContentChanged,
    VoidCallback onPressed, {
    TextEditingController titleController,
    TextEditingController valueController,
    bool needTitle = true,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
//            child: new IssueEditDialog(
//              dialogTitle,
//              onTitleChanged,
//              onContentChanged,
//              onPressed,
//              titleController: titleController,
//              valueController: valueController,
//              needTitle: needTitle,
//            ),
              );
        });
  }

  static Future<Null> showCommitOptionDialog(
    BuildContext context,
    List<String> commitMaps,
    ValueChanged<int> onTap, {
    width = 250.0,
    height = 400.0,
    List<Color> colorList,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: new Container(
              width: width,
              height: height,
              padding: new EdgeInsets.all(4.0),
              margin: new EdgeInsets.all(20.0),
              decoration: new BoxDecoration(
                color: Color(0xffffffff),
                //用一个BoxDecoration装饰器提供背景图片
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: new ListView.builder(
                  itemCount: commitMaps.length,
                  itemBuilder: (context, index) {
                    return GlobalFlexButton(
                      maxLines: 2,
                      mainAxisAlignment: MainAxisAlignment.start,
                      fontSize: 14.0,
                      color: colorList != null
                          ? colorList[index]
                          : Theme.of(context).primaryColor,
                      text: commitMaps[index],
                      textColor: Color(0xffffffff),
                      onPress: () {
                        Navigator.pop(context);
                        onTap(index);
                      },
                    );
                  }),
            ),
          );
        });
  }

  static showAlertDialog(
    BuildContext context,
    String title,
    String myContent, {
    width = 250.0,
    height = 400.0,
        type =  AlertType.warning,
       onPressed,
       buttonLabel= "返回",
  }) {

    Alert(
      context: context,
      style: AlertStyle(
        animationType: AnimationType.fromTop,
        isCloseButton: false,
        isOverlayTapDismiss: true,
        descStyle: TextStyle(fontWeight: FontWeight.normal),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: TextStyle(
          color: Color(0xff3B424E),
        ),
      ),
      type: type,
      title: title,
      desc: myContent,
      buttons: [
        DialogButton(
          child: Text(
             buttonLabel,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
             if(onPressed==null){
                Navigator.pop(context);
             }else{
               onPressed();
             }
          },
          color: Color(0xff8A82EF),
          radius: BorderRadius.circular(5.0),
        ),
      ],
    ).show();
  }


  static showCommitDialog(
      BuildContext context,
      String title,
      String myContent, {
        width = 250.0,
        height = 400.0,
        type =  AlertType.warning,
        onPressedCancel,
        onPressedConfirm,
        cancelLabel= "取消",
        confirmLabel= "确定",
      }) {

    Alert(
      context: context,
      style: AlertStyle(
        animationType: AnimationType.fromTop,
        isCloseButton: false,
        isOverlayTapDismiss: true,
        descStyle: TextStyle(fontWeight: FontWeight.normal),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: TextStyle(
          color: Color(0xff3B424E),
        ),
      ),
      type: type,
      title: title,
      desc: myContent,
      buttons: [
        DialogButton(
          child: Text(
            cancelLabel,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            if(onPressedCancel==null){
              Navigator.pop(context);
            }else{
              onPressedCancel();
            }
          },
          color: Color(0xff8A82EF),
          radius: BorderRadius.circular(5.0),
        ),
        DialogButton(
          child: Text(
            confirmLabel,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            if(onPressedConfirm==null){
              Navigator.pop(context);
            }else{
              onPressedConfirm();
            }
          },
          color: Color(0xff8A82EF),
          radius: BorderRadius.circular(5.0),
        ),
      ],
    ).show();
  }
  /**
   * 放大图片查看
   */
  static Future<Null> showImageDialog(
      BuildContext context,
      String filePath,
      ) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return  GestureDetector(
            child: Material(
              type: MaterialType.transparency,
//              child: ZoomableImage(  filePath.indexOf("http")==0? NetworkImage(filePath) : AssetImage(filePath),placeholder: CircularProgressIndicator(),),
//            ),
            ),
            onTap: (){
               Navigator.pop(context);
            },
          );
        });
  }


  /// dart  生成固定随机数
 static String getRandomId(){
    String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
    int strlenght = 10; /// 生成的字符串固定长度
    String left = '';
    for (var i = 0; i < strlenght; i++) {
      left = left + alphabet[Random().nextInt(alphabet.length)];
    }
    return left;
  }

}
