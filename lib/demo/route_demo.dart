import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('home'),
              onPressed: null,
            ),
            FlatButton(
              child: Text('about'),
              //方法二：这个是命名路由，必须在Material 有 routes才可以
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              //方法一：
              // onPressed: (){//这种是普通路由的方式
              //   Navigator.of(context).push(
              //     MaterialPageRoute(builder: (BuildContext context)=>Page1(title: 'about',))
              //   );
              // },
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final String title;
  Page1({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 1.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
