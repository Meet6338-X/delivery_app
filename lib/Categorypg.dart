import 'package:flutter/material.dart';
import 'package:delivery_app/vegetablelist.dart';
// Import other list screens here

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories = [
    Category('Vegetables', 'images/vegetablemain.png', 43),
    Category('Fruits', 'images/Fruitmain.png', 32),
    Category('Bread', 'images/Breadmain.png', 22),
    Category('Sweets', 'images/Sweetsmain.png', 56),
    Category('Noodles', 'images/noddlemain.png', 17),
    Category('Coffee', 'images/cofffeemain.png', 28),
    Category('Dairy', 'images/Dairy-product.jpg', 30)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Text(
                'Category',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search ',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VegetableListScreen()),
                      );
                      },
                    child: CategoryContainer(category: categories[index]),
                  );
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
        currentIndex: 0,
        selectedItemColor: Colors.purple,
        onTap: (index) {},
      ),
    );
  }

  void _navigateToCategory(BuildContext context, Category category) {
    Widget nextPage;
    // switch (category.name) {
    //   case 'Vegetables':
    //     nextPage = VegetableListScreen();
    //     break;
    //   case 'Fruits':
    //     nextPage = FruitListScreen();
    //     break;
    //   case 'Bread':
    //     nextPage = BreadListScreen();
    //     break;
    //   case 'Sweets':
    //     nextPage = SweetsListScreen();
    //     break;
    //   case 'Noodles':
    //     nextPage = NoodlesListScreen();
    //     break;
    //   case 'Coffee':
    //     nextPage = CoffeeListScreen();
    //     break;
    //   case 'Dairy':
    //     nextPage = DairyListScreen();
    //     break;
    //   default:
    //     nextPage = Container();
    //     break;
    // }
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => nextPage),
    // );
  }
}

class Category {
  final String name;
  final String imagePath;
  final int itemCount;
  Category(this.name, this.imagePath, this.itemCount);
}

class CategoryContainer extends StatelessWidget {
  final Category category;
  const CategoryContainer({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                category.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('${category.itemCount} items'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}