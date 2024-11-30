import 'package:flutter/material.dart';

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
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      ),
    );
  }
}
