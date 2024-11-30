import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(7),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 174, 174, 174),
            offset: Offset(-5, 5),
            blurRadius: 12,
          )
        ],
      ),
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Image of the product
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 3,
            padding: const EdgeInsets.all(1),
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageurl),
              ),
            ),
          ),

          //Details of the product in cart
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(4, 6, 0, 0),
                  decoration: const BoxDecoration(),
                  child: Text(
                    pName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(7, 2, 0, 0),
                  decoration: const BoxDecoration(),
                  child: Text(
                    "Size: $size",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 174, 173, 173),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(7, 2, 0, 0),
                  decoration: const BoxDecoration(),
                  child: Text(
                    "Qty: $quantity",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 174, 173, 173),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(7, 2, 0, 0),
                  decoration: const BoxDecoration(),
                  child: Text(
                    "Rs.$price",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 174, 173, 173),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                  decoration: const BoxDecoration(),
                  child: Text(
                    "Total: ${price * quantity}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
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
