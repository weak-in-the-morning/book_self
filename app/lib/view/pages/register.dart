import 'package:flutter/material.dart';
import 'package:app/view/components/app_button.dart';
import 'package:app/view/components/input_field.dart';

class Register extends StatelessWidget {
  const Register({
    super.key,
  });
  // final TextEditingController controller2;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller1 =
        TextEditingController(text: '初期値');
    return Column(
      children: [
        InputField(formTitle: '本のタイトル', controller: controller1),
        (AppButton.filled(
            label: '登録',
            onTap: () {
              String text = controller1.text;
              // debugPrint("入力内容は" + text);
            })),
      ],
    );
  }
}
