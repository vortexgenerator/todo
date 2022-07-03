import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/screens/login_screen.dart';

import 'list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      moveScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'SplashScreen',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '나만의 일정관리 : TODO 리스트 앱',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => ListScreen())));
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    print("[*] is Login : ${isLogin.toString()}");
    return isLogin;
  }
}
