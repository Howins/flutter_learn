import 'package:flutter/material.dart';
import 'package:flutter_learn/demo/item_detail_demo.dart';
import '../model/post.dart';
import 'item_detail_demo.dart';

//列表视图抽取
class MyListView extends StatelessWidget {
  //创建方法，返回列表
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                //通过列表显示并排版
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    postList[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ), //这里相当于加多了一个高度为16的空格，只是为了排版好看
                Text(
                  postList[index].title,
                  style: Theme.of(context).textTheme.title, //文字样式抄袭当前主题的文字样式
                ),
                Text(
                  postList[index].title,
                  style: Theme.of(context).textTheme.subhead, //文字样式抄袭当前主题的文字样式
                ),
              ],
            ),
            Positioned.fill(
              //如果不设定，将填满内容。
              child: Material(
                color: Colors.transparent, //设置背景颜色
                child: InkWell(
                  //设置溅墨效果，支持路由反馈
                  splashColor: Colors.white.withOpacity(0.3), //反馈颜色
                  highlightColor: Colors.white.withOpacity(0.1), //点触刹那颜色
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context)=>PostShow(post: postList[index],),
                      )
                    ),
                  },
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postList.length,
      itemBuilder: _listItemBuilder,
    );
  }
}
