// this screen shows the deyails of the seller clicked on
import 'package:classico/product.dart';
import 'package:classico/productsdetails.dart';
import 'package:classico/seller.dart';
import 'package:flutter/material.dart';

class SellerDetailScreen extends StatelessWidget {
  final Seller seller;

  const SellerDetailScreen({Key? key, required this.seller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = getProductsBySeller(seller.shop_name);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: 'sellerAvatar_${seller.shop_name}',
                        child: Image.asset(
                          seller.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      seller.shop_name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Seller: ${seller.seller}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    Text(
                      'Type: ${seller.type}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    Text(
                      'City: ${seller.city}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    Text(
                      'Contact: ${seller.contact_no}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Products available',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'productImage_${products[index].name}',
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                          ),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.0),
                                    bottomLeft: Radius.circular(12.0),
                                  ),
                                  child: Image.asset(
                                    products[index].imageUrl,
                                    width: 120,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          products[index].name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          products[index].description,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  List<Product> getProductsBySeller(String sellerName) {
    // This is your mock data; you can replace it with actual data retrieval logic.
    return [
      Product(
        name: 'Tomatoes',
        description: 'Fresh tomatoes from the farm',
        imageUrl: 'assets/images/tomato.jpg',
      ),
      Product(
        name: 'Gun',
        description: 'Weapon for self-defense',
        imageUrl: 'assets/images/gun.png',
      ),
      Product(
        name: 'Toy',
        description: 'Toy car for kids',
        imageUrl: 'assets/images/toy.jpg',
      ),
      Product(
        name: 'Pepsi',
        description: 'Cold drink for refreshment',
        imageUrl: 'assets/images/pepsi.jpg',
      ),
      Product(
        name: 'Handsfree',
        description: 'Handsfree for mobile phones',
        imageUrl: 'assets/images/handsfree.jpg',
      ),
      Product(
        name: 'Air jorden 5',
        description: 'Shoes for sports and casual wear',
        imageUrl: 'assets/images/shoe.jpg',
      ),
    ];
  }
}
