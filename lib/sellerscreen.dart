// this screen shows the availablity of shops on the platform
import 'package:classico/seller.dart';
import 'package:classico/sellercard.dart';
import 'package:flutter/material.dart';

class SellerScreen extends StatefulWidget {
  @override
  _SellerScreenState createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  final List<Seller> allSellers = [
    Seller(
        shop_name: 'Habib Nihari Hotel',
        imageUrl: 'assets/images/person1.jpg',
        type: 'Medical Store',
        city: 'Pano Aqil',
        contact_no: "0333-1234567",
        seller: 'Usama'),
    Seller(
        shop_name: 'Umer Garment Store',
        imageUrl: 'assets/images/person2.jpg',
        type: "Grocery",
        city: "Sukkur",
        contact_no: "0333-1234567",
        seller: 'Umer'),
    Seller(
        shop_name: 'Tiktik Super Store',
        imageUrl: 'assets/images/person3.jpg',
        type: "Spare Parts",
        city: "Sukkur",
        contact_no: "0333-1234567",
        seller: 'Karan'),
    Seller(
        shop_name: 'Dipin Dots',
        imageUrl: 'assets/images/person4.jpg',
        type: "Fast Food",
        city: "Sukkur",
        contact_no: "0333-1234567",
        seller: 'Dr. Dipin'),
  ];

  List<Seller> filteredSellers = [];
  String selectedCity = 'All Cities';
  String selectedType = 'All Types';

  @override
  void initState() {
    super.initState();
    filteredSellers = List.from(allSellers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Available Shops',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton<String>(
                        value: selectedCity,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCity = newValue!;
                            _filterSellers();
                          });
                        },
                        items: _buildDropdownItems([
                          'All Cities',
                          ...allSellers.map((e) => e.city).toSet()
                        ]),
                        underline: SizedBox(), // Hide default underline
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        isExpanded: true,
                        elevation: 8,
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton<String>(
                        value: selectedType,
                        onChanged: (newValue) {
                          setState(() {
                            selectedType = newValue!;
                            _filterSellers();
                          });
                        },
                        items: _buildDropdownItems([
                          'All Types',
                          ...allSellers.map((e) => e.type).toSet()
                        ]),
                        underline: SizedBox(), // Hide default underline
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        isExpanded: true,
                        elevation: 8,
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Filter by city and type to see results:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            child: filteredSellers.isEmpty
                ? Center(
                    child: Text(
                      'No sellers available for the selected filters.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: filteredSellers.length,
                    itemBuilder: (context, index) {
                      return SellerCard(seller: filteredSellers[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List<String> options) {
    return options.map((option) {
      return DropdownMenuItem(value: option, child: Text(option));
    }).toList();
  }

  void _filterSellers() {
    setState(() {
      filteredSellers = allSellers.where((seller) {
        return (selectedCity == 'All Cities' || seller.city == selectedCity) &&
            (selectedType == 'All Types' || seller.type == selectedType);
      }).toList();
    });
  }
}
