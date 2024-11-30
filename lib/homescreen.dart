import 'package:classico/imageslider.dart';
import 'package:classico/productsgrid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _allProducts = [
    {
      'name': 'Athletic shoes',
      'imageURL': 'assets/images/shoe.jpg',
      'price': 200.0
    },
    {
      'name': 'Handsfree',
      'imageURL': 'assets/images/handsfree.jpg',
      'price': 150.0
    },
    {
      'name': 'Eyeliner',
      'imageURL': 'assets/images/eyeliner.jpg',
      'price': 100.0
    },
    {'name': 'Tomatoes', 'imageURL': 'assets/images/tomato.jpg', 'price': 50.0},
    {'name': 'Pepsi', 'imageURL': 'assets/images/pepsi.jpg', 'price': 20.0},
    {'name': 'Toy Car', 'imageURL': 'assets/images/toy.jpg', 'price': 12.0},
    {'name': 'Plant', 'imageURL': 'assets/images/plant.jpg', 'price': 5.0},
    {
      'name': 'Sun Glasses',
      'imageURL': 'assets/images/glasses.jpg',
      'price': 30.0
    }
  ];

  List<Map<String, dynamic>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = List.from(_allProducts);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _searchProducts(String query) {
    setState(() {
      _filteredProducts = _allProducts.where((product) {
        return product['name'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
            child: SizedBox(
              height: 50,
              child: TextField(
                onChanged: _searchProducts,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26.0),
                  ),
                ),
              ),
            ),
          ),
          const ImageSliderBuilder(
            imageUrls: [
              'assets/images/sale.jpg',
              'assets/images/arrival2.jpg',
              'assets/images/shoes.jpg'
            ],
          ),
          ProductGrid(products: _filteredProducts),
        ],
      ),
    );
  }
}
