import 'package:fluro_demo/application.dart';
import 'package:fluro_demo/person.dart';
import 'package:fluro_demo/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageB extends StatefulWidget {
  Person person;

  PageB(this.person, {Key? key}) : super(key: key);

  @override
  _PageB createState() => _PageB();
}

class _PageB extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Routes.router.navigateTo(context, Routes.pageC);
              },
              child: const Text('跳转页面C'),
            ),
            Text('接收自定义对象${widget.person.name}'),
          ],
        ),
      ),
    );
  }
}
