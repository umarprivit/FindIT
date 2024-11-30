import 'package:classico/Components/mytextfield.dart';
import 'package:classico/checkout.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String? selectedPaymentMethod = "COD";
  final cvvController = TextEditingController();
  final expiryController = TextEditingController();
  final accountcontroller = TextEditingController();

  void ontap(value) {
    setState(() {
      selectedPaymentMethod = value;
      debugPrint(selectedPaymentMethod);
    });
  }

  String? cardvalidator(value) {
    if (value == null || value > 16 || value < 16) {
      return "Enter a valid card Number";
    } else {
      return null;
    }
  }

  String? accountvalidator(value) {
    if (value == null || value.length > 11 || value.length < 11) {
      return "Enter a valid Account Number";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Main me constructor change krna he
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_new_rounded),
        //   onPressed: () {},
        // ),
        title: const Text(
          "Payment Methods",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(3),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  minimumSize: Size(MediaQuery.of(context).size.width - 30, 45),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white),
              child: const Text(
                "Confirm Payment Method",
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Checkout()));
              },
            ),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Payment Methods.
          Column(children: [
            //Radion Button for Credit Card
            RadioListTile<String>(
              title: const Row(
                children: [
                  Icon(Icons.credit_card_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text("CreditCard or DebitCard")
                ],
              ),
              value: 'Card',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),

            //Radio Button for easypaisa
            PaymentOption(
              value: "easypaisa",
              image: "epaisa.png",
              name: "EasyPaisa",
              selectedPaymentMethod: selectedPaymentMethod,
              ontap: ontap,
            ),
            //Radio Button for JazzCash
            PaymentOption(
              value: "jazzcash",
              image: "jcash.png",
              name: "JazzCash",
              selectedPaymentMethod: selectedPaymentMethod,
              ontap: ontap,
            ),
            //Radio Button for Cash on Delivery
            PaymentOption(
              value: "COD",
              image: "COD.png",
              name: "Cash On Delivery",
              selectedPaymentMethod: selectedPaymentMethod,
              ontap: ontap,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(255, 194, 194, 194),
                  width: 0.5,
                ),
              )),
            ),
          ]),
          if (selectedPaymentMethod != "COD")
            Column(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(12, 10, 0, 10),
                    child: Text(
                      selectedPaymentMethod == "Card"
                          ? "Enter Card Details :"
                          : "Enter Account Details :",
                      style: const TextStyle(fontSize: 19),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: MyTextField(
                        hintText: selectedPaymentMethod == "Card"
                            ? "4931 4213 4123 2133"
                            : "03001234567",
                        validator: selectedPaymentMethod == "Card"
                            ? cardvalidator
                            : accountvalidator,
                        label: selectedPaymentMethod == "Card"
                            ? "Card Number"
                            : "Account Number",
                        controller: accountcontroller),
                  ),
                ),
                if (selectedPaymentMethod == "Card")
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                    child: Row(
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 40,
                          child: MyTextField(
                            validator: (value) {
                              if (value == null ||
                                  value.length < 3 ||
                                  value.length > 3) {
                                return "Enter valid CVV";
                              } else {
                                return null;
                              }
                            },
                            hintText: "344",
                            label: "CVV",
                            controller: cvvController,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 15,
                          child: MyTextField(
                            validator: (value) {
                              if (value == null ||
                                  value.length < 4 ||
                                  value.length > 5) {
                                return "Enter valid Expiry Date";
                              } else {
                                return null;
                              }
                            },
                            hintText: "03/23",
                            label: "Expiry Date",
                            controller: expiryController,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String image;
  final String name;
  final String value;
  final String? selectedPaymentMethod;
  final Function(dynamic) ontap;

  const PaymentOption(
      {super.key,
      required this.value,
      required this.image,
      required this.name,
      required this.selectedPaymentMethod,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
        title: Row(
          children: [
            Image.asset(
              'assets/images/epaisa.png',
              scale: 11,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(name)
          ],
        ),
        value: value,
        groupValue: selectedPaymentMethod,
        onChanged: ontap);
  }
}
