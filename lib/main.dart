import 'package:flutter/material.dart';
import 'demo/listview_demo.dart';
import 'demo/bottom_navi_bar_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/layout_demo.dart';
import 'demo/view_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/route_demo.dart';
import 'demo/form_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug的时候不显示那个debug条的
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow, //配置主题导航栏的颜色主题风格
        highlightColor:
            Color.fromRGBO(255, 255, 255, 0.5), //设置点击触发的高亮颜色的为白色，默认灰色，不透明度0.5
        splashColor: Colors.green[100], //设置水波纹的颜色
      ),
      // home: NavigatorDemo(),
      initialRoute: '/form', //如果定义这个，不在home:定义
      routes: {
        //命名路由
        '/': (context) => AppHome(), //NavigatorDemo(),
        '/about': (context) => Page1(
              title: 'about',
            ),
        '/form': (context) => FormDemo(),
      },
    );

    //home: AppHome());
    //home: SliverDemo());
  }
}

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100], //设置背景颜色
        appBar: AppBar(
          // //在APPBAR前面添加一个按钮，如果设置了Drawer,则会自动添加此按钮
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: '个人资料',
          //   onPressed: () => debugPrint('按下了菜单键'),
          // ),
          elevation: 0.0, //配置appbar的阴影
          title: Text(
            'Hello学习Flutter',
          ),
          //title后面添加Action小动作（其实也是添加IconButton），一般也是使用IconButton，这里会相应到
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: '搜索',
              onPressed: () => debugPrint('按下了搜索键'),
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: '搜索',
              onPressed: () => debugPrint('按下了点点点'),
            ),
          ],
          centerTitle: true, //居中标题，iOS风格
          bottom: TabBar(
            //在AppBar的底部加入Tabar
            unselectedLabelColor: Colors.black38, //设置没有选择的tab的颜色应该比较浅
            indicatorColor: Colors.black54, //设置指示器颜色为比较深的黑色，默认白色
            indicatorSize: TabBarIndicatorSize.label, //设置指示器长度为Icon的长度，默认全长
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)), //使用Icon显示每个Tab的
              Tab(icon: Icon(Icons.change_history)), //使用Icon显示每个Tab的
              Tab(icon: Icon(Icons.directions_bike)), //使用Icon显示每个Tab的
              Tab(icon: Icon(Icons.view_quilt)), //使用Icon显示每个Tab的
            ],
          ),
        ),
        drawer: MyDrawer(), //设置抽屉
        bottomNavigationBar: MyBottomNavitagionBar(),
        body: TabBarView(
          children: <Widget>[
            MyListView(), //顶部栏的第一个Tab显示ListView
            BasicDemo(),
            SliverDemo(),
            ViewDemo(),
          ],
        ),
        //body: ListViewDemo(),
      ),
    );
  }
}
