import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return TextDemo();
    return Container(
      //通过decoration添加背景图
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://resources.ninghao.org/images/free_hugs.jpg'),
          alignment: Alignment.topCenter,
          repeat: ImageRepeat.noRepeat,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.indigoAccent[200], BlendMode.hardLight)
        )
      ),
      // color: Colors.grey[300],
      //盒子中只有一个子项，并且默认居中
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, //这个是让一行中的内容居中显示的，MainAxis主轴对齐
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0), //外边距
            padding: EdgeInsets.only(left: 30.0, bottom: 24.0), //内边距
            width: 100.0,
            height: 80.0,
            // color: Colors.white,//如果在子容器中加入的颜色，就会与此引起冲突，所以要注释掉
            //横行的内容
            child: Icon(
              Icons.poll,
              color: Colors.blue,
              size: 32.0,
            ),
            //给行中的内容装饰的
            decoration: BoxDecoration(
              color: Colors.yellow,
              //添加边框
              border: Border.all(
                color: Colors.indigoAccent[100],
                width: 3, //边框的大小，就是框的厚的程度
                style: BorderStyle.solid,
              ),
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(15.0),
              //   topRight: Radius.circular(6.0),
              // ), //设置边框的圆角，需要在边框外边设置
              shape: BoxShape.circle,//如果设置Box为圆形，就不能设置圆角效果
              gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 99, 1.0)
                ]
              ),//添加中心渐变效果，还有Linear渐变效果
              boxShadow: [
                BoxShadow(
                  offset: Offset(6, 3),
                  color: Colors.amber,
                  blurRadius: 12.0,
                  spreadRadius: -1.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//简单文本Demo
class TextDemo extends StatelessWidget {
  final String _title = '长恨歌';
  final String _author = '白居易';

  final TextStyle _textStyle = TextStyle(
    fontSize: 18.0,
  );
  @override
  Widget build(BuildContext context) {
    return Text(
      '《$_title》--$_author 漢皇重色思傾國，御宇多年求不得。楊家有女初長成，養在深閨人未識。天生麗質難自棄，一朝選在君王側。回眸一笑百媚生，六宮粉黛無顏色。春寒賜浴華清池，溫泉水滑洗凝脂。侍兒扶起嬌無力，始是新承恩澤時。雲鬢花顏金步搖，芙蓉帳暖度春宵。',
      style: _textStyle,
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

//富文本
class RichTexeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'aabbcc',
            style: TextStyle(
              color: Colors.purpleAccent,
              fontStyle: FontStyle.italic,
              fontSize: 34.0, //让字体显示大点
              fontWeight: FontWeight.w100, //让字体线条变细
            ),
            //这个会默认继承父类的style
            children: [
          TextSpan(
              text: '123456',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ]));
  }
}
