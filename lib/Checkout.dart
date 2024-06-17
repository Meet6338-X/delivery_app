import 'package:delivery_app/creditdebit.dart';
import 'package:delivery_app/vegetableinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
bool _status = false;
class CheckoutScreen extends StatefulWidget {
  @override
  State<CheckoutScreen> createState() => _checkoutScreenState();
}

class _checkoutScreenState extends State<CheckoutScreen> {
  int myindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VegetableInfoState(),
                        ),
                      );
                    },
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                  Center(
                    child: Text('                 Checkout',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'Payment Method',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => creditdebitstate()),
                        );
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(color: Color(0xff7203FF), fontSize: 22),
                      ))
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(
                    Icons.credit_card,
                    size: 40,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    '**** **** **** 4747',
                    style: TextStyle(color: Color(0xff9586A8), fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Delivery options',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Change',
                        style: TextStyle(color: Color(0xff7203FF), fontSize: 22),
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.directions_run,
                    size: 40,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'I’ll pick it up myself',
                    style: TextStyle(fontSize: 22, color: Color(0xff9586A8)),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.directions_bike_outlined,
                    size: 40,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'By courier',
                    style: TextStyle(fontSize: 22, color: Color(0xff9586A8)),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage('images/drone.png'),
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'By Drone',
                    style: TextStyle(fontSize: 22, color: Color(0xff7203FF)),
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  Icon(Icons.check, color: Color(0xff7203FF), size: 30)
                ],
              ),
              SizedBox(
                height: 30,
              ),
      Row(
        children: [
          Text('Non-contact-delivery', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          SizedBox(width:50),
          FlutterSwitch(
            width: 74.0,
            height: 30.0,
            value: _status, // Use the initialized status
          //  borderRadius: 25.0,
            //padding: ,
            activeColor: Color(0xffE2CBFF),
            inactiveColor: Color(0xffE2CBFF),
            activeText: 'Yes',
            inactiveText: 'No',
            activeTextColor: Color(0xff7203FF),
            inactiveTextColor: Color(0xff7203FF),
            showOnOff: true,
            inactiveTextFontWeight: FontWeight.w500,
            activeTextFontWeight: FontWeight.w500,
            valueFontSize: 14,
            toggleSize: 23,
            onToggle: (val) {
              setState(() {
                _status = val;
              });
            },
          ),
        ],),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: myindex, // Use _selectedIndex if needed
        selectedItemColor: Colors.purple,
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
      ),
    );
  }
}
