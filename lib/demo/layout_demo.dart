import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Column(children: <Widget>[
    //    IconBadge(Icons.pool,size: 64.0,),
    // ],);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // AspectRatio(//设置子部件的宽高比
        // aspectRatio: 3.0/2.0,
        //   child: Container(
        //     color: Colors.blue,
        //   ),
        // )
        ConstrainedBox(//设置
          constraints: BoxConstraints(minHeight: 200.0, maxWidth: 100.0),
          child: Container(
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}

class StackPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,//基于主轴平均分配剩余空间对齐
      // crossAxisAlignment: CrossAxisAlignment.start,//基于交叉轴起点对齐
      children: <Widget>[
        //强制写入部件的大小
        Stack(
          //Stack可以放置一堆小部件，而且是以层叠形式呈现的,当然还可以使用Position小部件控制控件在stack中的位置
          alignment: Alignment.topCenter, //里面的小部件的对其方式
          children: <Widget>[
            SizedBox(
              width: 200.0,
              height: 200.0,
              child: Container(
                alignment: Alignment(-0.8, 0.8), //子部件相对于容器的对齐
                decoration: BoxDecoration(
                  color: Colors.blue, //设置背景颜色
                  //  borderRadius: BorderRadius.circular(8.0),//设置背景框的圆角角度
                  // shape: BoxShape.circle,
                ),
                child: Icon(Icons.pages, color: Colors.white, size: 34.0),
              ),
            ),
            //使用一个空白格作为间隔
            SizedBox(
              height: 100.0,
            ),
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: Container(
                decoration: BoxDecoration(
                    //  color: Colors.yellow,//设置背景颜色
                    borderRadius: BorderRadius.circular(8.0), //设置背景框的圆角角度
                    gradient: RadialGradient(colors: [
                      Colors.red,
                      Colors.green,
                    ])),
                child: Icon(Icons.edit, color: Colors.white, size: 34.0),
              ),
            ),
            Positioned(
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
              right: 20.0,
              top: 30.0,
            ),
            Positioned(
              child: Icon(Icons.ac_unit, color: Colors.white, size: 12.0),
              right: 30.0,
              top: 10.0,
            ),
            Positioned(
              child: Icon(Icons.ac_unit, color: Colors.white, size: 22.0),
              right: 40.0,
              top: 60.0,
            ),
          ],
        ),

        // IconBadge(Icons.pool),
        // IconBadge(Icons.beach_access,size: 64.0,),
        // IconBadge(Icons.airplanemode_active),
      ],
    );
  }
}

//创建可以重复使用的小部件
class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  //默认构造函数，由于size有默认值，所以用个花括号括起来
  IconBadge(this.icon, {this.size = 32.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
