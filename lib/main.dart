import 'package:delivery_app/Checkout.dart';
import 'package:delivery_app/Splash_screen.dart';
import 'package:delivery_app/creditdebit.dart';
import 'package:delivery_app/fruitlist.dart';
import 'package:delivery_app/vegetableinfo.dart';
import 'package:delivery_app/vegetablelist.dart';
import 'package:flutter/material.dart';

void main() => runApp(myapp2());

class myapp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      home: SplashScreen(),
      // routes: {
      //   '/vegetable': (context) => const VegetableListScreen(),
      //   '/fruitlist'
      // },
    );
  }
}
