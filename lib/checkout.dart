import 'package:classico/delivery.dart';
import 'package:classico/payments.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  final double subtotal = 5000;

  const Checkout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(
              fontWeight: FontWeight.w600, letterSpacing: 0, fontSize: 21),
        ),
        centerTitle: true,
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: ElevatedButton(
                onPressed: () {
                  buildAlertDialog(context);
                },
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    padding: const EdgeInsets.all(0),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize:
                        Size((MediaQuery.of(context).size.width) - 20, 50)),
                child: const Text(
                  "Place Order",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          CheckoutOption(
              text: "Delivery Address",
              detail: "C/105 , Street 34 , London City, UK",
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Deliveryaddress()));
              }),
          CheckoutOption(
              text: "Payment Method",
              detail: "EasyPaisa(0300-2003123)",
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentMethod()));
              }),
          const SizedBox(
            height: 15,
          ),
          displaybottomline("Subtotal", "Rs.2000"),
          displaybottomline("Delivery", "Rs.0"),
          displaybottomline("Taxes", "5%"),
          displaybottomline("Total", "Rs.2250")
        ],
      ),
    );
  }

  Widget buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Order Placed'),
      content: const Text('Your order has been placed successfully.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

Widget displaybottomline(String text, String value) {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 235, 234, 234)))),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 174, 174, 174),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ));
}

class CheckoutOption extends StatelessWidget {
  final String text;
  final String detail;
  final VoidCallback ontap;
  const CheckoutOption({
    super.key,
    required this.text,
    required this.detail,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(2, 3, 0, 3),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(8, 6, 0, 0),
                          decoration: const BoxDecoration(),
                          child: Text(
                            text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.fromLTRB(9, 2, 0, 5),
                          decoration: const BoxDecoration(),
                          child: Text(
                            detail,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 174, 173, 173),
                            ),
                          )),
                    ])),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.arrow_forward_ios_rounded),
            // )
          ],
        ),
      ),
    );
  }
}
