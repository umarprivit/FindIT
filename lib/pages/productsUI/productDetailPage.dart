import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  //List for images it can be passed from constructor.
  List images = [
    "https://images.unsplash.com/photo-1543163521-1bf539c55dd2?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1560769629-975ec94e6a86?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1549298916-b41d501d3772?q=80&w=2012&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  ];

  int currentIndex = 0; //current index of image means which image is on screen
  String productName =
      "Nike Sports Shoes"; //this value is also intitialized by constructor for various products

  double price = 6000; //same for this
  bool small = false,
      medium = false,
      large = false; // this is for selecting the size in choice chip

  String description = "This is one of the product by NIKE"; //description
  String sizefit = "The size here mentioned is global and general size.";
  String returnpolicy =
      "You can easily return or refund your products by sending the reason why you want to return or exchange the product and in case of any problem you can send us the images of the product.";

//quantity add and subtract
  int quantity = 0;
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
      //Top bar with 2 buttons
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        actions: [
          IconButton(
              onPressed: () {
                print("Back button pressed");
              },
              icon: const Icon(Icons.shopping_bag_outlined))
        ],
      ),

      //Bottom Bar with quantity and add to cart button
      bottomNavigationBar: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 210, 209, 209),
                      offset: const Offset(0, 3),
                      blurRadius: 12)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: onsub,
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            minimumSize: const Size(10, 10),
                            backgroundColor:
                                const Color.fromARGB(255, 235, 234, 234)),
                        child: const Text(
                          "-",
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                        padding: const EdgeInsets.all(4),
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "$quantity",
                          style: const TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        )),
                    ElevatedButton(
                        onPressed: onadd,
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            minimumSize: const Size(10, 10),
                            backgroundColor:
                                const Color.fromARGB(255, 235, 234, 234)),
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Add To Cart"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 109, 71, 236),
                        foregroundColor: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),

      //Whole body where all product details are mentioned
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Code to display images.
            Stack(
              children: [
                CarouselSlider(
                  items: images
                      .map((e) => Image.network(
                            e,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ))
                      .toList(),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.40,
                    scrollPhysics: const BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast),
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) => setState(() {
                      currentIndex = index;
                    }),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.asMap().entries.map((e) {
                      print(e);
                      print(e.key);
                      return Container(
                        height: e.key == currentIndex ? 9 : 7,
                        margin: const EdgeInsets.all(5),
                        width: e.key == currentIndex ? 8 : 7,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            color: e.key == currentIndex
                                ? const Color.fromARGB(255, 114, 106, 106)
                                : const Color.fromARGB(255, 224, 224, 224)),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),

            //Name and price of the Product and share button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(10, 13, 0, 0),
                      child: Text(
                        productName,
                        style: const TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        "Rs.$price",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 105, 103, 103)),
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.share)),
                )
              ],
            ),

            //Code to display sizes
            Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.symmetric(vertical: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                      label: const Text("S"),
                      selected: small,
                      onSelected: (value) {
                        setState(() {
                          small = value;
                        });
                      }),
                  ChoiceChip(
                      label: const Text("M"),
                      selected: medium,
                      onSelected: (value) {
                        bool m = true;
                        setState(() {
                          medium = value;
                        });
                      }),
                  ChoiceChip(
                      label: const Text("L"),
                      selected: large,
                      onSelected: (value) {
                        bool xs = true;
                        setState(() {
                          large = value;
                        });
                      })
                ],
              ),
            ),

            //Expansion tile for text details of the product
            ExpansionTile(
              title: const Text("Description"),
              children: [
                ListTile(
                  title: Text(
                    description,
                    style: const TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
            ExpansionTile(
              title: const Text("Size & Fit"),
              children: [
                ListTile(
                  title: Text(
                    sizefit,
                    style: const TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
            ExpansionTile(
              title: const Text("Delivery & Return"),
              children: [
                ListTile(
                  title: Text(
                    returnpolicy,
                    style: const TextStyle(fontSize: 14),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
