import 'package:classico/Components/mytextfield.dart';
import 'package:classico/checkout.dart';
import 'package:flutter/material.dart';

class Deliveryaddress extends StatefulWidget {
  const Deliveryaddress({super.key});

  @override
  State<Deliveryaddress> createState() => _DeliveryaddressState();
}

class _DeliveryaddressState extends State<Deliveryaddress> {
  final houseNoController = TextEditingController();

  final streetNoController = TextEditingController();
  final postalcodeController = TextEditingController();

  final cityController = TextEditingController();

  final List provinces = ["Sindh", "Punjab", "Balochistan", "KPK", "Gilgit"];

  @override
  Widget build(BuildContext context) {
    String selectedprovince = provinces[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Address",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Text field for taking street
          SizedBox(
            width: (MediaQuery.of(context).size.width) - 17,
            child: MyTextField(
                validator: (value) {
                  if (value == null) {
                    return "Enter a valid Street";
                  } else {
                    return null;
                  }
                },
                label: "Street/Area.",
                controller: streetNoController),
          ),
          const SizedBox(
            height: 7,
          ),
          //Textfields for city and area in a row
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            child: Row(
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  child: MyTextField(
                      validator: (value) {
                        if (value == null) {
                          return "Enter valid City Name";
                        } else {
                          return null;
                        }
                      },
                      label: "City",
                      controller: cityController),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) - 5,
                  child: MyTextField(
                      validator: (value) {
                        if (value == null) {
                          return "Enter a valid House Number";
                        } else {
                          return null;
                        }
                      },
                      label: "House/Appartment No.",
                      controller: streetNoController),
                ),
              ],
            ),
          ),
          //DropDown Menu for province and Text Field for postal code in a row
          const SizedBox(
            height: 1,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            child: Row(
              children: [
                //Provinces Dropdown menu
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 60, 60, 60), width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  child: DropdownButton<String>(
                      padding: const EdgeInsets.fromLTRB(20, 7.2, 0, 7.2),
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      hint: const Text("Provinces"),
                      style: const TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 117, 117, 117),
                      ),
                      underline: Container(),
                      value: selectedprovince,
                      items: provinces.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {
                          selectedprovince = newvalue ?? "";
                        });
                      }),
                ),
                const SizedBox(
                  width: 8,
                ),
                //PostalCode Text Field.
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) - 5,
                  child: MyTextField(
                      validator: (value) {
                        if (value == null) {
                          return "Enter a valid Postal Code";
                        } else {
                          return null;
                        }
                      },
                      label: "Postal Code",
                      controller: postalcodeController),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //Save address button.
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Checkout()));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              minimumSize: Size(MediaQuery.of(context).size.width - 30, 50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: const Text("Save Address"),
          )
        ],
      ),
    );
  }
}
