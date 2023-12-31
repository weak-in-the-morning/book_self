import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String formTitle;
  final String? hintText;
  final TextEditingController controller;
  //紙の本かどうか
  final bool? isSelectedEbook;

  const InputField(
      {super.key,
      required this.formTitle,
      required this.controller,
      this.hintText,
      this.isSelectedEbook = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(formTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 15),
                    textAlign: TextAlign.left)),
            SizedBox(
              height: 40,
              child: TextFormField(
                enabled: isSelectedEbook,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: hintText,
                ),
                controller: controller,
              ),
            )
          ],
        ));
  }
}
