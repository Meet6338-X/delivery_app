import 'package:delivery_app/Checkout.dart';
import 'package:delivery_app/Splash_screen.dart';
import 'package:delivery_app/creditdebit.dart';
import 'package:delivery_app/fruitlist.dart';
import 'package:delivery_app/vegetableinfo.dart';
import 'package:delivery_app/vegetablelist.dart';
import 'package:flutter/material.dart';

void main() => runApp(myapp1());

class myapp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      home: SplashScreen(),
      // routes: {
      //   '/vegetablelist': (context) => const VegetableListScreen(),
      //   '/fruitlist'
      // },
    );
  }
}
