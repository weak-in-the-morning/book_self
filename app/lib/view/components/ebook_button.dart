import 'package:flutter/material.dart';

class EbookButton extends StatelessWidget {
  final String label;
  final String imgSrc;

  const EbookButton({
    super.key, 
    required this.label, 
    required this.imgSrc,
    });

  @override
  Widget build(BuildContext context) {
    return 
      TextButton(
        onPressed: () {},
        child: SizedBox(
          width: 96,
          height: 96,
          child: Column(
            children: [
              Image.asset(
                imgSrc,
                width: 48,
                height: 48,
                ),
              Text(label),
              ],
            ),
        ),
      );
  }
}