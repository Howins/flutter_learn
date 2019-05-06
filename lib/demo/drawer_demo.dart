import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          //设置从屏幕由左向右拉的抽屉小部件
          child: ListView(
            //使用ListView布局抽屉里面的内容
            padding: EdgeInsets.zero, //内边距设置为0
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('AccountName',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: Text('account@account.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://resources.ninghao.org/images/wanghao.jpg'),
                ),
                //添加背景图像需要添加decoration
                decoration: BoxDecoration(
                    color: Colors.yellow[400], //底部颜色
                    image: DecorationImage(
                      //底图
                      image: NetworkImage(
                          'https://resources.ninghao.org/images/candy-shop.jpg'),
                      fit: BoxFit.cover, //设置底图放置模式，完全覆盖
                      colorFilter: ColorFilter.mode(
                        //设置颜色滤镜，1是设置颜色，2是设置混合模式
                        Colors.yellow[400].withOpacity(0.6),//这里本来就给颜色弄透明了
                        BlendMode.hardLight,//这个就是鼎鼎大名的照片滤镜了
                      ),
                    )),
              ),
              // DrawerHeader(//设置DrawerHeader,大约占头部1/4,但如果这里打算显示用户信息，则可以使用UserAccountsDrawerHeader
              //   child: Text('header'.toUpperCase()),
              //   decoration: BoxDecoration(color: Colors.grey[300]),//背景颜色
              // ),
              //设置剩余的内容，大约占3/4
              ListTile(
                leading:
                    Icon(Icons.mobile_screen_share, color: Colors.grey[300]),
                title: Text(
                  'Message',
                  textAlign: TextAlign.right,
                ),
                trailing: Icon(Icons.message, color: Colors.grey[400]),
                onTap: () => Navigator.pop(context), //当点击此选项时候，自动关闭抽屉，或者做一系列动作
              ),
              ListTile(
                leading:
                    Icon(Icons.mobile_screen_share, color: Colors.grey[300]),
                title: Text(
                  'Favorite',
                  textAlign: TextAlign.right,
                ),
                trailing: Icon(Icons.favorite, color: Colors.grey[400]),
                onTap: () => Navigator.pop(context), //当点击此选项时候，自动关闭抽屉，或者做一系列动作
              ),
              ListTile(
                leading:
                    Icon(Icons.mobile_screen_share, color: Colors.grey[300]),
                title: Text(
                  'Setting',
                  textAlign: TextAlign.right,
                ),
                trailing: Icon(Icons.settings, color: Colors.grey[400]),
                onTap: () => Navigator.pop(context), //当点击此选项时候，自动关闭抽屉，或者做一系列动作
              ),
            ],
          ),
        );
  }
}