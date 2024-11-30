import 'package:flutter/material.dart';
import 'package:find_it/components/cart_entity.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List cartItems = [
    {
      "pid": "222",
      "pname": "Sneakers",
      "size": "L",
      "price": 6000.0,
      "quantity": 2,
      "imageurl":
          "https://images.unsplash.com/photo-1549298916-b41d501d3772?q=80&w=2012&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "pid": "223",
      "pname": "Ladies Sandal",
      "size": "M",
      "price": 1500.0,
      "quantity": 3,
      "imageurl":
          "https://images.unsplash.com/photo-1543163521-1bf539c55dd2?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "pid": "224",
      "pname": "MultiColored Sneakers",
      "size": "S",
      "price": 5000.0,
      "quantity": 1,
      "imageurl":
          "https://images.unsplash.com/photo-1560769629-975ec94e6a86?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
  ];
  double finaltotal = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 197, 195, 195),
        title: const Text(
          "Shopping Cart",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {},
        ),
      ),

      //Bottom navigation bar for displaying total and checkout button
      bottomNavigationBar: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 190, 188, 188),
                  offset: Offset(0, 3),
                  blurRadius: 12,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                      child: const Text(
                        "Total: ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 109, 71, 236),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        "$finaltotal",
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
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
                )
              ],
            ),
          )
        ],
      ),

      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          var item = cartItems[index];
          finaltotal += item["price"];
          return Dismissible(
            background: Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 231, 38, 24),
              ),
              child: const Icon(Icons.delete),
            ),
            key: Key(item["pid"]),
            child: CartEntity(
              pid: item["pid"],
              pName: item["pname"],
              imageurl: item["imageurl"],
              price: item["price"],
              quantity: item["quantity"],
              size: item["size"],
            ),
            onDismissed: (direction) {
              setState(() {
                cartItems.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
