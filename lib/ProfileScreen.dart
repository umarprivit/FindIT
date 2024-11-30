import 'package:classico/sellersideui.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 0),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mail_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileOption(
              title: "Seller Dashboard", // New option for sellers
              icon: Icons.storefront, // Icon indicating it's for sellers
              isSellerOption: true, // Indicate it's a seller option
              onTap: () {
                // Perform action for Seller Dashboard
                // For example, navigate to the Seller Dashboard screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SellerDashboardScreen()),
                );
              },
            ),
            ProfileOption(
              title: "Orders & Returns",
              icon: Icons.auto_awesome_mosaic_outlined,
              detail: "View all orders",
              onTap: () {
                // Navigate to orders screen
              },
            ),
            ProfileOption(
              title: "Saved Items",
              icon: Icons.bookmark_add_outlined,
              onTap: () {
                // Navigate to saved items screen
              },
            ),
            ProfileOption(
              title: "Account Settings",
              icon: Icons.settings,
              onTap: () {
                // Navigate to account settings screen
              },
            ),
            ProfileOption(
              title: "Help & Support",
              icon: Icons.help_outline,
              onTap: () {
                // Navigate to help & support screen
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Log out",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final String? detail;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSellerOption; // New property to indicate if it's a seller option

  const ProfileOption({
    Key? key,
    required this.title,
    required this.icon,
    this.detail,
    required this.onTap,
    this.isSellerOption = false, // Default value is false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: isSellerOption
              ? Text(
                  'For Sellers Only', // Display subtitle for seller option
                  style: TextStyle(color: Colors.grey),
                )
              : detail != null
                  ? Text(detail!)
                  : null,
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
