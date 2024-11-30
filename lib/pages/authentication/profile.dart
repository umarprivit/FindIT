import 'package:find_it/components/profileoption.dart';

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String title = "Orders & Returns";

  final String detail = "View all orders";

  const Profile({super.key});

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.mail_outlined))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ProfileOption(
            title: "Orders & Returns",
            icon: Icons.auto_awesome_mosaic_outlined,
            detail: "View all orders",
          ),
          const ProfileOption(
            title: "Saved Items",
            icon: Icons.bookmark_add_outlined,
          ),
          const ProfileOption(title: "Account Settings", icon: Icons.settings),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 244, 243, 243)),
              child: const Text(
                "Log out",
                style: TextStyle(fontSize: 17, color: Color(0xFF6C6C6C)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
