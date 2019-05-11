import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //title: Text('AppBar'),
            //pinned: true,//标题一直固定在那里
            //floating: true,//稍微往下拉就可以显示标题
            expandedHeight: 178.0, //伸展高度，相当于弹性空间
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Learning Flutter',
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              background: Image.network(
                'https://resources.ninghao.org/images/keyclack.jpg',
                fit: BoxFit.cover,
                //colorBlendMode: BlendMode.hardLight,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              // sliver: SliverGridDemo(),
              sliver: SliverListDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            // child: Container(//这样也是不行
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: NetworkImage(
            //         postList[index].imageUrl,
            //       ),
            //       fit: BoxFit.cover,
            //     ),
            //     borderRadius: BorderRadius.circular(12.0)
            //   ),
            // ),
            child: Material(
              borderRadius: BorderRadius.circular(
                  12.0), //这个是Material的参数，圆角边框(为什么应用到图片不生效了？)
              elevation: 14.0,
              shadowColor: Colors.green.withOpacity(0.8),
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      child: Image.network(
                        postList[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 32.0,
                      top: 32.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            postList[index].title,
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.white),
                          ),
                          Text(
                            postList[index].title,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        },
        childCount: postList.length,
      ), //构建网格视图里面的项目
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //构建横行的个数，行间距
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.6,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              postList[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: postList.length,
      ), //构建网格视图里面的项目
    );
  }
}
