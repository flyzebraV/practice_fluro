import 'dart:convert';

import 'package:fluro_demo/person.dart';
import 'package:fluro_demo/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageA extends StatefulWidget {
  Map<String, List<String>> params;

  PageA(this.params, {Key? key}) : super(key: key);

  @override
  _PageA createState() => _PageA();
}

class _PageA extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments;
    var argumentsStr = arguments.toString();
    print(arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text('页面A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('接收参数=' + jsonEncode(widget.params)),
            ElevatedButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Routes.router.pop(context);
                }
              },
              child: const Text("直接关闭pop"),
            ),
            ElevatedButton(
              onPressed: () {
                Routes.router.pop(context, "返回值ok");
              },
              child: const Text("关闭，并返回参数"),
            ),
            ElevatedButton(
              onPressed: () {
                Routes.router.navigateTo(context, Routes.pageB,
                    routeSettings:
                        RouteSettings(arguments: Person("lucy", 22)));
              },
              child: const Text('跳转页面B，传递自定义对象'),
            ),
          ],
        ),
      ),
    );
  }
}
