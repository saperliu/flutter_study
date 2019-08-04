import 'dart:async';
import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_study/common/event/http_error_event.dart';
import 'package:flutter_study/common/net/code.dart';
import 'package:flutter_study/ui/common/global_store/state.dart';
import 'package:flutter_study/ui/common/global_store/store.dart';
import 'package:flutter_study/ui/pages/login/page.dart';
import 'package:flutter_study/ui/pages/welcome/page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'ui/common/localization/localizations_delegate.dart';
import 'ui/common/style/global_style.dart';
import 'ui/common/style/style_utils.dart';

void main() {
  runApp(new FlutterReduxApp());

  LogUtil.init(isDebug: true,tag: "study    app ");

  PaintingBinding.instance.imageCache.maximumSize = 100;
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class FlutterReduxApp extends StatelessWidget {

  FlutterReduxApp({Key key}) : super(key: key);

  ///定义路由,需要跳转的页面都要在此提前声明
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'welcome': WelcomePage(),
      'login': LoginPage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {

      if (page.isTypeof<GlobalBaseState>()) {
        page.connectExtraStore<GlobalState>(GlobalStore.store,
                (Object pagestate, GlobalState appState) {
              final GlobalBaseState p = pagestate;
              if (p.themeColor == appState.themeColor) {
                return pagestate;
              } else {
                if (pagestate is Cloneable) {
                  final Object copy = pagestate.clone();
                  final GlobalBaseState newState = copy;
                  newState.themeColor = appState.themeColor;
                  return newState;
                }
              }
            });
      }

      page.enhancer.append(
        viewMiddleware: <ViewMiddleware<dynamic>>[safetyView<dynamic>()],
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],
        effectMiddleware: [],
        middleware: <Middleware<dynamic>>[logMiddleware<dynamic>()],
      );

      // }
      ///updateMiddleware
      /// TODO
      // ..updateMiddleware(
      //   view: (List<ViewMiddleware<T>> viewMiddleware) {
      //     viewMiddleware.add(safetyView<T>());
      //   },
      //   adapter: (List<AdapterMiddleware<T>> adapterMiddleware) {
      //     adapterMiddleware.add(safetyAdapter<T>());
      //   },
      // )
    },
  );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      ///多语言实现代理
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalLocalizationsDelegate.delegate,
      ],
      debugShowCheckedModeBanner: false,  // 设置去掉右上角的debug字样
      locale: Locale('zh', 'CH'),
      supportedLocales: [Locale('zh', 'CH')],
      theme: StyleUtils.getThemeData(GlobalColors.primarySwatch),
      home: routes.buildPage("welcome", null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return routes.buildPage(settings.name, settings.arguments);
        });
      },
    );
  }
}

class MainLocalizations extends StatefulWidget {
  final Widget child;

  MainLocalizations({Key key, this.child}) : super(key: key);

  @override
  State<MainLocalizations> createState() {
    return new _MainLocalizations();
  }
}

class _MainLocalizations extends State<MainLocalizations> {
  StreamSubscription stream;

  @override
  Widget build(BuildContext context) {
//    return new StoreBuilder<GlobalState>(builder: (context, store) {
//      ///通过 StoreBuilder 和 Localizations 实现实时多语言切换
//      return new Localizations.override(
//        context: context,
//        locale: store.state.locale,
//        child: widget.child,
//      );
//    });
  }

  @override
  void initState() {
    super.initState();
    stream = Code.eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        Fluttertoast.showToast(
            msg: StyleUtils.getLocale(context).network_error);
        break;
      case 401:
        Fluttertoast.showToast(
            msg: StyleUtils.getLocale(context).network_error_401);
        break;
      case 403:
        Fluttertoast.showToast(
            msg: StyleUtils.getLocale(context).network_error_403);
        break;
      case 404:
        Fluttertoast.showToast(
            msg: StyleUtils.getLocale(context).network_error_404);
        break;
      case Code.NETWORK_TIMEOUT:
      //超时
        Fluttertoast.showToast(
            msg: StyleUtils.getLocale(context).network_error_timeout);
        break;
      default:
        Fluttertoast.showToast(
            msg: StyleUtils.getLocale(context).network_error_unknown +
                " " +
                message);
        break;
    }
  }
}
