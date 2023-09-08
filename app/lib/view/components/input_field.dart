import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String formTitle;
  final String? hintExample;

  InputField({required this.formTitle, this.hintExample});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(formTitle,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                    textAlign: TextAlign.left)),
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: hintExample,
                ),
              ),
            )
          ],
        ));
  }
}
