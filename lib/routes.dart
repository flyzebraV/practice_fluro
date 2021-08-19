/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:fluro_demo/main.dart';
import 'package:fluro_demo/page_A.dart';
import 'package:fluro_demo/page_C.dart';
import 'package:fluro_demo/person.dart';
import 'package:flutter/material.dart';

import 'page_B.dart';

class Routes {
  /// 1.创建FluroRouter 实例对象
  static final FluroRouter router = FluroRouter();

  /// 2.路由路径
  static String homePage = "/";
  static String pageA = "/A";
  static String pageB = "/B";
  static String pageC = "/C";

  /// 3.处理跳转参数和返回路由实例
  static var pageAHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return PageA(params);
  });
  static var pageBHandler = Handler(handlerFunc: (context, params) {
    final args = context!.settings!.arguments as Person;
    return PageB(args);
  });
  static var pageCHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return PageC();
  });

  /// 4.注册路由（页面）
  static void defineRoutes() {
    router.define(homePage,
        handler: Handler(handlerFunc: (_, __) => HomePage()));
    router.define(pageA, handler: pageAHandler);
    router.define(pageB, handler: pageBHandler);
    router.define(pageC, handler: pageCHandler);

    //没有找到路由
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
  }
}
