import 'package:flutter/material.dart';
import 'package:flutter_learn/model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;
  PostShow({
    @required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Image.network(post.imageUrl),
          Container(
              width: double
                  .infinity, //这个设置是可以让宽度沾满屏幕的宽度，不然下面的CrossAxisAlignment 不生效
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(post.title,
                      style: Theme.of(context).textTheme.title), //设置和标题一样的样式
                  Text(post.author,
                      style: Theme.of(context).textTheme.subhead), //设置和标题一样的样式
                  SizedBox(
                    height: 32.0,
                  ), //这个设置占位，空白一块高度出来
                  Text(post.description,
                      style: Theme.of(context).textTheme.body1), //设置和标题一样的样式
                ],
              )),
        ],
      ),
    );
  }
}
