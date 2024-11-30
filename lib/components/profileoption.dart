import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final String? detail;
  final IconData icon;

  const ProfileOption({
    super.key,
    required this.title,
    required this.icon,
    this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.fromLTRB(15, 9, 10, 9),
              decoration: const BoxDecoration(
                  color: Color(0xFFeaeaea),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Icon(
                icon,
                size: 37,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                if (detail != null)
                  Text(
                    "$detail",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 160, 159, 159)),
                  )
              ],
            )
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward,
              size: 29,
            ))
      ],
    );
  }
}
