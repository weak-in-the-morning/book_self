import 'package:flutter/material.dart';
import 'package:app/view/components/app_button.dart';
import 'package:app/view/components/input_field.dart';
//import 'package:app/view/components/ebooks.dart';
//import 'package:app/view/components/ebook_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _Register();
}

// enum BookStore{

// }

class _Register extends State<Register> {
  int? selectedBookstoreIndex;
  List<String> bookStores = ['まんがセゾン', 'Kindle', '楽天ブックス'];
  List<String> bookStoreImages = [
    'assets/images/Sezon.jpg',
    'assets/images/Kindle.png',
    'assets/images/RakutenBooks.png'
  ];

  // Widget button({required String text, required int index}) {
  //   return InkWell(
  //     splashColor: Colors.cyanAccent,
  //     onTap: () {
  //       setState(() {
  //         selectedBookstoreIndex = index;
  //       });
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.all(12),
  //       color: index == selectedBookstoreIndex ? Colors.blue : Colors.white,
  //       child: Text(
  //         text,
  //         style: TextStyle(
  //           color:
  //               index == selectedBookstoreIndex ? Colors.white : Colors.black,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget button2({required int index, required String imgSrc}) {
  //   return EbookButton(
  //     label: bookStores[index],
  //     imgSrc: bookStoreImages[index],
  //     onPressed: () {
  //       setState(() {
  //         selectedBookstoreIndex = index;
  //       });
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.all(12),
  //       color: index == selectedBookstoreIndex ? Colors.blue : Colors.white,
  //       child: Text(
  //         text,
  //         style: TextStyle(
  //           color:
  //               index == selectedBookstoreIndex ? Colors.white : Colors.black,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerTitle =
        TextEditingController(text: '初期値');
    final TextEditingController controllerNum =
        TextEditingController(text: '初期値');
    final TextEditingController controllerURL =
        TextEditingController(text: '初期値');
    final TextEditingController controllerTag =
        TextEditingController(text: '初期値');
    final TextEditingController controllerMemo =
        TextEditingController(text: '初期値');

    //ボタンのウィジェット

    return SingleChildScrollView(
        child: Column(
      children: [
        InputField(formTitle: '本のタイトル', controller: controllerTitle),
        InputField(formTitle: '巻数', controller: controllerNum),
        // Row(
        //   children: [
        //     ...List.generate(
        //       bookStores.length,
        //       (index) => button(
        //         index: index,
        //         text: bookStores[index],
        //       ),
        //     ),
        //   ],
        // ),
        InputField(formTitle: 'URL', controller: controllerURL),
        InputField(formTitle: 'タグ', controller: controllerTag),
        InputField(formTitle: 'メモ', controller: controllerMemo),
        (AppButton.filled(
            label: '登録',
            onTap: () {
              //ここに登録ボタン押した時の処理
              //したはデバッグの時使ってた処理
              // String text = controller1.text;
              // debugPrint("入力内容は" + text);
            })),
      ],
    ));
  }
}
