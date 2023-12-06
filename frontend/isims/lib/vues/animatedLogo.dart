import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isims/vues/home.dart';
import 'package:isims/vues/login/login.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3,milliseconds: 500)).then((value) => Get.offAll(()=>LoginPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Animator(
        tween: Tween<double>(begin: 0,end: 300),
          cycles: 0,
          duration: Duration(seconds: 2),
          builder: (context,animatorState,child)=>
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: animatorState.value,
              width: animatorState.value,
              child: Image.asset("assets/isims_logo.jpeg"),
            ),
          )

      ),
    );
  }
}
