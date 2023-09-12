import 'package:flutter/material.dart';
import 'package:app/view/components/app_button.dart';
import 'package:app/view/components/input_field.dart';
import 'package:app/view/components/ebooks.dart';
import 'package:app/view/components/ebook_button.dart';

///電子書籍のサイト4つ：まんがセゾン、Kindle、楽天ブックス、DMMブックス

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _Register();
}

// enum BookStore{

// }

class _Register extends State<Register> {
  int? selectedBookstoreIndex;
  List<String> bookStores = ['まんがセゾン', 'Kindle', '楽天ブックス', 'DMMブックス'];
  List<String> bookStoreImages = [
    'assets/images/Sezon.jpg',
    'assets/images/Kindle.png',
    'assets/images/RakutenBooks.png',
    'assets/images/DMMBooks.png'
  ];

  Widget EbookButton({
    required int index,
    required String label,
    required String imgSrc,
  }) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedBookstoreIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: index == selectedBookstoreIndex
                    ? Colors.grey
                    : Colors.black.withOpacity(0)),
            borderRadius: BorderRadius.circular(5)),
        width: 76,
        height: 76,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgSrc,
              width: 48,
              height: 48,
            ),
            Text(label, style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget button({required String text, required int index}) {
    return InkWell(
      splashColor: Colors.cyanAccent,
      onTap: () {
        setState(() {
          selectedBookstoreIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        color: index == selectedBookstoreIndex ? Colors.blue : Colors.white,
        child: Text(
          text,
          style: TextStyle(
            color:
                index == selectedBookstoreIndex ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

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
        Row(
          children: [
            ...List.generate(
              bookStores.length,
              (index) => EbookButton(
                index: index,
                label: bookStores[index],
                imgSrc: bookStoreImages[index],
              ),
            ),
          ],
        ),
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
