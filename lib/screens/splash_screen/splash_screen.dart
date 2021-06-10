import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../constants/base_environment.dart';
import '../../constants/base_string.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _start() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/index');
    });
  }

  //Waking up api when a sleep
  void initApi() async {
    Dio dio = Dio();
    await dio.get('https://retribusi.jambikota.go.id/');
  }

  @override
  void initState() {
    super.initState();
    initApi();
    _start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Text(
                  BaseString.appNameDetail,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('${BaseEnvironment.imageAssets}login.png',
                  width: 300.0, height: 300.0),
              Text(
                BaseString.appName,
                style: TextStyle(fontSize: 30.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
