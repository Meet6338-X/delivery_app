import 'package:carousel_slider/carousel_slider.dart';
import 'package:delivery_app/Checkout.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final Map<int, bool> likedItems = {};

class VegetableInfoState extends StatefulWidget {
  @override
  State<VegetableInfoState> createState() => _VegeInfoState();
}

class _VegeInfoState extends State<VegetableInfoState> {
  int activeIndex = 0;
  bool isLiked = likedItems[0] ?? false;
  final List<String> vegetableImages = [
    'images/vegetable1.png',
    'images/vegetable2.jpg',
    'images/vegetable3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F5F5), // Set the background color
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 250,
                      viewportFraction: 1,
                      autoPlay: true,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                    itemCount: vegetableImages.length,
                    itemBuilder: (context, index, realIndex) {
                      return buildImage(vegetableImages[index], index);
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: buildIndicator(),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color inside the container
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(30), // Radius for the top-left corner
                    topRight:
                        Radius.circular(30), // Radius for the top-right corner
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Boston Lettuce',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1.10 € / piece',
                        style: TextStyle(fontSize: 22, color: Colors.grey),
                      ),
                      Text(
                        '~ 150 gr / piece',
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Spain',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Lettuce is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled.',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 130),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: IconButton(
                              icon: Icon(
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              color: isLiked ? Colors.red : Colors.black,
                              onPressed: () {
                                setState(() {
                                  likedItems[0] = !isLiked;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckoutScreen(),
                                ),
                              );
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Icon(Icons.shopping_cart,size: 20,color: Colors.white,),
                                  SizedBox(width: 10,),
                                  Text('ADD TO CART',style: TextStyle(color: Colors.white),),
                                ],
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xff0BCE83),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String imagePath, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        color: Colors.grey,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: vegetableImages.length,
        effect: ExpandingDotsEffect(
          dotWidth: 8,
          dotHeight: 8,
          activeDotColor: Colors.green,
          dotColor: Colors.grey,
        ),
      );
}
