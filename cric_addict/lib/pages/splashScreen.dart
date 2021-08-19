import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final message;
  const SplashScreen({Key? key, this.message}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: Text(widget.message)),
      ),
    );
  }
}
