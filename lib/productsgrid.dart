import 'package:classico/ProductItem.dart';
import 'package:classico/productsdetails.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key, required this.products}) : super(key: key);

  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailPage()),
              );
            },
            child: ProductItem(
              imageUrl: products[index]['imageURL'] as String,
              productName: products[index]['name'] as String,
              price: products[index]['price'] as double,
            ),
          );
        },
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.85,
          crossAxisSpacing: 0,
          mainAxisSpacing: 2,
        ),
      ),
    );
  }
}
