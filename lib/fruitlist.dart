import 'package:flutter/material.dart';
class fruitsList {
  final String name;
  final String image;
  final double price;
  final String unit;
  fruitsList(this.name, this.image, this.price, this.unit);
}
class FruitListScreen extends StatefulWidget {
  @override
  State<FruitListScreen> createState() => _FruitListScreenState();
}
class _FruitListScreenState extends State<FruitListScreen> {
  final List<fruitsList> categories = [
    fruitsList('Apple', 'images/apple.jpg', 1.10, 'piece'),
    fruitsList('Orange ', 'images/orangef.jpg', 2, 'kg'),
    fruitsList('banana ', 'images/banana.jpg', 1.45, 'kg'),
    fruitsList('Tomato', 'images/tomato.jpg', 1.20, 'kg'),
    fruitsList('Blueberries', 'images/blueberries.jpg', 1.0, 'kg'),
    fruitsList('Carrots', 'images/carrots.jpg', 2.0, 'kg'),
  ];
  final Map<int, bool> likedItems = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left:2,right: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
                      Text(
                        'Fruits',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Image.asset("images/lemon-bg.png")
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('Cabbage and lettuce', 14, true),
                    _buildCategoryChip('Cucumbers and tomatoes', 10, false),
                    _buildCategoryChip('Onions and garlic', 8, false),
                    _buildCategoryChip('Peppers', 7, false),
                    _buildCategoryChip('Potatoes and carrots', 12, false),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return _buildFruitItem(index, categories[index]);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 0, // Use _selectedIndex if needed
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          // Handle bottom navigation bar item tap
          // You can add navigation logic here
        },
      ),
    );
  }

  Widget _buildCategoryChip(String label, int count, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ChoiceChip(
        label: Text('$label ($count)',style: TextStyle(color: Color(0xff6C0EE4)),),
        selected: isSelected,
        onSelected: (selected) {},
        selectedColor: Color(0xffE2CBFF),
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildFruitItem(int index, fruitsList fruit) {
    bool isLiked = likedItems[index] ?? false;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 177,
            height: 128,
            child: Image.asset(fruit.image, fit: BoxFit.cover),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(fruit.name, style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('${fruit.price} € / ${fruit.unit}',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: Container(
                          height: 48,
                          width: 78,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: IconButton(
                            icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                            ),
                            color: isLiked ? Colors.red : Colors.black,
                            onPressed: () {
                              setState(() {
                                likedItems[index] = !isLiked;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 78,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xff0BCE83)),
                        child: IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed:
                              () {}, // Add functionality for adding to cart
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
    );
  }
}
