import 'package:fluro/fluro.dart';
import 'package:fluro_demo/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    /// 注册
    Routes.defineRoutes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.router.generator,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String resultStr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Routes.router.navigateTo(context, Routes.pageA);
              },
              child: const Text('跳转页面A(不带参数)'),
            ),
            ElevatedButton(
              onPressed: () {
                Routes.router
                    .navigateTo(context, Routes.pageA + "?id=123abc&qq=6666");
              },
              child: const Text('跳转页面A，并传递参数'),
            ),
            ElevatedButton(
              onPressed: () {
                //直接传递中文报错 Illegal percent encoding in URI
                Routes.router.navigateTo(context,
                    Routes.pageA + "?id=${Uri.encodeComponent("中文123abc")}");
                print('${Uri.encodeComponent("中文123abc")}');
              },
              child: const Text('跳转页面A，并传递参数中文'),
            ),
            ElevatedButton(
              onPressed: () async {
                var result = await Routes.router
                    .navigateTo(context, Routes.pageA + "?id=123abc");
                setState(() {
                  resultStr = result as String;
                });
              },
              child: Text('跳转页面A，接收返回参数'),
            ),
            Text('接收返回参数=${resultStr}'),
            ElevatedButton(
              onPressed: () {
                Routes.router.navigateTo(context, Routes.pageA, replace: true);
              },
              child: const Text('跳转页面A，并关闭当前'),
            ),
            ElevatedButton(
              onPressed: () {
                Routes.router.navigateTo(context, Routes.pageA,
                    transition: TransitionType.inFromLeft);
              },
              child: const Text('跳转页面A，内置多种切换动画'),
            ),
          ],
        ),
      ),
    );
  }
}
