import 'package:classico/imageslider.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<String> images = [
    'assets/images/shoe.jpg',
    'assets/images/shoe2.png',
    'assets/images/shoe3.jpg'
  ];
  int currentIndex = 0;
  String productName = "Nike Sports Shoes";
  double price = 6000;
  String description = "This is one of the product by NIKE";
  String sizefit = "The size here mentioned is global and general size.";
  String returnpolicy =
      "You can easily return or refund your products by sending the reason why you want to return or exchange the product and in case of any problem you can send us the images of the product.";
  int quantity = 0;
  bool smallSelected = false;
  bool mediumSelected = false;
  bool largeSelected = false;

  void onadd() {
    setState(() {
      quantity++;
    });
  }

  void onsub() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Product Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: onsub,
              icon: Icon(Icons.remove),
            ),
            Text(quantity.toString()),
            IconButton(
              onPressed: onadd,
              icon: Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add To Cart'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Replace CarouselSlider with your custom ImageSliderBuilder
            ImageSliderBuilder(
              imageUrls: images, // Pass the images list to your custom widget
              // onImageChanged: (index) {
              //   setState(() {
              //     currentIndex = index;
              //   });
              // },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Rs. $price',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Size:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          _buildSizeButton('S'),
                          SizedBox(width: 10),
                          _buildSizeButton('M'),
                          SizedBox(width: 10),
                          _buildSizeButton('L'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildExpansionTile('Description', description),
                  SizedBox(height: 20),
                  _buildExpansionTile('Size & Fit', sizefit),
                  SizedBox(height: 20),
                  _buildExpansionTile('Delivery & Return', returnpolicy),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build size selection button
  Widget _buildSizeButton(String size) {
    bool selected = false;
    if (size == 'S') {
      selected = smallSelected;
    } else if (size == 'M') {
      selected = mediumSelected;
    } else if (size == 'L') {
      selected = largeSelected;
    }

    return OutlinedButton(
      onPressed: () {
        setState(() {
          smallSelected = size == 'S';
          mediumSelected = size == 'M';
          largeSelected = size == 'L';
        });
      },
      child: Text(
        size,
        style: TextStyle(
          fontSize: 16,
          color: selected ? Colors.white : Colors.black,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 20),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          selected ? Colors.blue : Colors.transparent,
        ),
      ),
    );
  }

  Widget _buildExpansionTile(String title, String content) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
