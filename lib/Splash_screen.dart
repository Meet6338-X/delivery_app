import 'package:delivery_app/Categorypg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bottomnav.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image for the entire screen
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Backgroundimage.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Purple background color
            Container(
              color: Color(0xFFA259FF),
            ),
            // White background image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/whitebackground.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 20,
                  // backgroundImage: AssetImage('images/logo.png'),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                // Container(
                //   height: 104,
                //   width: 104,
                //   decoration:
                //   BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                //   child: Image.asset("images/deliveryappsplashscreen.png",
                //   ),
                // ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: Image.asset("images/deliveryappsplashscreen.png"),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Non-Contact \n   Deliveries',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'When placing an order, select the option\n"Contactless delivery" and the courier will leave\nyour order at the door.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigationBarWidget()),
                      );
                    },
                    child: Text('ORDER NOW'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(11, 206, 131, 1.0),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text('DISMISS'),
                  style: TextButton.styleFrom(),
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
