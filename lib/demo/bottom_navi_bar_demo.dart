import 'package:flutter/material.dart';

class MyBottomNavitagionBar extends StatefulWidget {
  @override
  _MyBottomNavitagionBarState createState() => _MyBottomNavitagionBarState();
}

class _MyBottomNavitagionBarState extends State<MyBottomNavitagionBar> {
  //这个是点击动作响应的用法
  int _currentIndex = 0;
  void _onTabHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        //设置底部导航栏
        currentIndex: _currentIndex, //当前的下标
        onTap: _onTabHandler, //点击的动作
        type: BottomNavigationBarType.fixed, //如果导航栏大于4个，就会一片白全部不见，需要修改成FIXED
        fixedColor: Colors.red, //设置激活状态下的颜色
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), title: Text("123")),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), title: Text("123")),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("123")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("123")),
        ]);
  }
}
