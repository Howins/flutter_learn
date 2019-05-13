import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
            primaryColor:
                Colors.black), //ThemeData(primaryColor: Colors.black),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TextFieldDemo(),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>(); //保存全局状态的KEY
  String username, password;
  bool validateAuto = false;

  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();

      debugPrint('username: ${username}');
      debugPrint('password: ${password}');

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('注册中，请稍后...'),
        ),
      );
    } else {
      setState(() {
        validateAuto = true;
      });
    }
  }

  String validateUsername(value) {
    if (value.isEmpty) {
      return '用户名为空';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return '密码为空';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: '用户名',
              helperText: '',
            ),
            onSaved: (value) {
              //保存表单数据
              username = value;
            },
            validator: validateUsername, //调用验证的方法，如果错误就返回相应的错误信息
            autovalidate: validateAuto,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: '密码',
              helperText: '',
            ),
            onSaved: (value) {
              password = value;
            },
            autovalidate: validateAuto, //自动校验，焦点离开校验
            validator: validatePassword, //调用验证的方法，如果错误就返回相应的错误信息
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('注册', style: TextStyle(color: Colors.black)),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(
        //初始给一个监听器，如果文本有变化就执行监听器
        () {
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      //对于文本的监听可以通过Controller,但是需要初始化和销毁
      // onChanged: (value) => {
      //       debugPrint('input: ${value}'),
      //     },
      // onSubmitted: (value) => {
      //       debugPrint('submit: ${value}'),
      //     },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Name',
        hintText: '请输入你的名字',
        // border: InputBorder.none,//这个是可以把文本输入提示的默认的线隐藏掉
        border: OutlineInputBorder(), //将默认的线换成框
        filled: true, //为默认的文本框填入颜色（灰色）
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}
