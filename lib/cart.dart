import 'package:flutter/material.dart';
import 'package:classico/checkout.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map<String, dynamic>> cartItems = [
    {
      "pid": "222",
      "pname": "Plant",
      "size": "L",
      "price": 6000.0,
      "quantity": 2,
      "imageurl": "assets/images/plant.jpg"
    },
    {
      "pid": "223",
      "pname": "Cold drink",
      "size": "1 litre",
      "price": 1500.0,
      "quantity": 3,
      "imageurl": "assets/images/pepsi.jpg"
    },
    {
      "pid": "224",
      "pname": "Sneakers",
      "size": "S",
      "price": 5000.0,
      "quantity": 1,
      "imageurl": "assets/images/shoe.jpg"
    },
  ];
  double finalTotal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Shopping Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          var item = cartItems[index];
          finalTotal += item["price"] * item["quantity"];
          return Dismissible(
            key: Key(item["pid"]),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              color: Colors.red,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                cartItems.removeAt(index);
              });
            },
            child: CartEntity(
              pid: item["pid"],
              pName: item["pname"],
              imageurl: item["imageurl"],
              price: item["price"],
              quantity: item["quantity"],
              size: item["size"],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ₹${finalTotal.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 109, 71, 236),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "CheckOut",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartEntity extends StatelessWidget {
  final String pid;
  final String pName;
  final String size;
  final double price;
  final int quantity;
  final String imageurl;

  const CartEntity({
    super.key,
    required this.pid,
    required this.pName,
    required this.imageurl,
    required this.price,
    required this.quantity,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              imageurl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "Size: $size",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "Price: ₹$price",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "Quantity: $quantity",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
