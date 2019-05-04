import 'package:flutter/material.dart';
import 'model/post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow, //配置主题导航栏的颜色主题风格
        ),
        home: AppHome());
  }
}

class AppHome extends StatelessWidget {
  //创建方法，返回列表
  Widget _listItemBuilder(BuildContext context,int index){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          //通过列表显示并排版
          Image.network(postList[index].imageUrl),
          SizedBox(height: 16.0,),//这里相当于加多了一个高度为16的空格，只是为了排版好看
          Text(
            postList[index].title,
            style: Theme.of(context).textTheme.title,//文字样式抄袭当前主题的文字样式
          ),
          Text(
            postList[index].title,
            style: Theme.of(context).textTheme.subhead,//文字样式抄袭当前主题的文字样式
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],//设置背景颜色
      appBar: AppBar(
        elevation: 0.0, //配置appbar的阴影
        title: Text('Hello学习Flutter',),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}
