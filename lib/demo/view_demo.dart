import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {
Widget _createItemBuilder(BuildContext context, int index){
  return Container(
    child: Image.network(postList[index].imageUrl,fit: BoxFit.cover,),

  );
}
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
       itemCount: postList.length,
  itemBuilder: _createItemBuilder,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
  ),//相当于Gridview.count
    );
  }
}

class GridViewExtendDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length){
    return List.generate(length, (int index){
      return Container(
          color: Colors.grey,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'item $index'
          ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      children: _buildTiles(100),//使用List.generator
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length){
    return List.generate(length, (int index){
      return Container(
          color: Colors.grey,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'item $index'
          ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      children: _buildTiles(100),//使用List.generator
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  //写页面函数
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          //这样用SizedBox.expand可以让整个页面填满
          child: Image.network(
            postList[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  postList[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
                Text(
                  postList[index].author,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: postList.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      //pageview是可以按住拖动实现页面切换的，如果响应了这个，那么上部tab就不能再往返拖动。以下一个Container代表一个页面
      // pageSnapping: false,//使得拖到一半的页面卡住，不是整页滑动
      // reverse: true,//使得滚动方向相反
      scrollDirection: Axis.vertical, //本来左右滚动的视图变成上下滚动。(默认左右)
      //页面在滚动的时候，会触发一个回调
      onPageChanged: (currentPage) => debugPrint("当前页：$currentPage"),
      controller: PageController(
        initialPage: 0,
        keepPage: false, //这个感觉不生效，不知道怎么用的
        viewportFraction: 0.8, //页面占空间比
      ),
      children: <Widget>[
        Container(
          color: Colors.blue,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'ONE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'TWO',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.red,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            '3RD',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
