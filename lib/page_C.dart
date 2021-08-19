import 'package:fluro_demo/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageC extends StatefulWidget {
  PageC({Key? key}) : super(key: key);

  @override
  _PageC createState() => _PageC();
}

class _PageC extends State<PageC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面C'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Routes.router
                    .navigateTo(context, Routes.homePage, clearStack: true);
              },
              child: const Text('跳转到首页，并清除所有栈'),
            ),
          ],
        ),
      ),
    );
  }
}
