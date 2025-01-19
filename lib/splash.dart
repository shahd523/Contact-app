import 'dart:async';
import 'package:assign4_flutter/imagess.dart';
import 'package:assign4_flutter/colors.dart';
import 'package:assign4_flutter/home.dart';
import 'package:flutter/material.dart';
class Splash extends StatelessWidget{
  static const String routeName="splash";
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5),() {
      Navigator.pushReplacementNamed(context, Home.routName);
    });
    return Scaffold(
      backgroundColor: colors.color1,
      body: Stack(
        children: [
          Align(alignment: Alignment.center,
              child: Image.asset(Imagess.splash))
        ],
      ),

    );
  }

}