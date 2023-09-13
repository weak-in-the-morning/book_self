import 'package:app/data/book_data.dart';
import 'package:app/logic/database.dart';
import 'package:flutter/material.dart';
import 'package:app/view/components/app_button.dart';
import 'package:app/view/components/input_field.dart';

///電子書籍のサイト4つ：まんがセゾン、Kindle、楽天ブックス、DMMブックス

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  //どの電子書籍選んでるかのint、初期値は紙
  int selectedBookstoreIndex = 4;
  String name = "";
  int num = -1;
  String service = "";
  bool hasRead = false;
  bool favorite = false;
  String tag = "";
  String memo = "";
  String urlSearch = "";

  List<String> bookStores = ['まんがセゾン', 'Kindle', '楽天ブックス', 'DMMブックス', '紙の本'];
  List<String> bookStoreImages = [
    'assets/images/Sezon.jpg',
    'assets/images/Kindle.png',
    'assets/images/RakutenBooks.png',
    'assets/images/DMMBooks.png'
  ];

  void _handleCheckbox(bool? e) {
    setState(() {
      hasRead = e!;
    });
  }

  //電子書籍のボタン
  Widget eBookButton({
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
            Text(label, style: const TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerTitle =
        TextEditingController(text: '初期値');
    final TextEditingController controllerNum =
        TextEditingController(text: '1');
    final TextEditingController controllerURL =
        TextEditingController(text: '紙の本は不要');
    final TextEditingController controllerTag =
        TextEditingController(text: '初期値');
    final TextEditingController controllerMemo =
        TextEditingController(text: '初期値');

    /// 画面本体
    return SingleChildScrollView(
        child: Column(
      children: [
        InputField(
          formTitle: '本のタイトル',
          controller: controllerTitle,
          isSelectedEbook: true,
        ),
        InputField(
          formTitle: '巻数',
          controller: controllerNum,
          isSelectedEbook: true,
        ),
        const Text('電子書籍サービス一覧'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              bookStores.length - 1,
              (index) => eBookButton(
                index: index,
                label: bookStores[index],
                imgSrc: bookStoreImages[index],
              ),
            ),
          ],
        ),
        //ここあとで紙の時は入力不可に
        InputField(
          formTitle: 'URL',
          controller: controllerURL,
          isSelectedEbook: selectedBookstoreIndex != 4,
        ),
        InputField(
          formTitle: 'タグ',
          controller: controllerTag,
          isSelectedEbook: true,
        ),
        InputField(
          formTitle: 'メモ',
          controller: controllerMemo,
          isSelectedEbook: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //お気に入りボタン
            IconButton(
              icon: (favorite
                  ? const Icon(
                      Icons.star_rounded,
                      color: Colors.yellow,
                    )
                  : const Icon(
                      Icons.star_border_rounded,
                      color: Colors.yellow,
                    )),
              onPressed: () {
                setState(() {
                  favorite = !favorite;
                });
              },
              iconSize: 50,
            ),
            //既読ボタン
            Column(children: [
              Icon(
                hasRead ? Icons.bookmark_add : Icons.bookmark_border_outlined,
                size: 30,
              ),
              Checkbox(
                activeColor: Colors.blue,
                value: hasRead,
                onChanged: _handleCheckbox,
              )
            ])
          ],
        ),
        (AppButton.filled(
            label: '登録',
            onTap: () async {
              //ここに登録ボタン押した時の処理
              name = controllerTitle.text;
              num = int.parse(controllerNum.text);
              service = bookStores[selectedBookstoreIndex];
              urlSearch =
                  (controllerURL.text == '紙の本は不要') ? '' : controllerURL.text;
              tag = controllerTag.text;
              memo = controllerMemo.text;
              await DatabaseHelper.instance.insert(
                BookData(
                  name: name,
                  num: num,
                  service: service,
                  hasRead: hasRead,
                  favorite: favorite,
                  tag: tag,
                  memo: memo,
                  urlSearch: urlSearch,
                ),
              );
            })),
      ],
    ));
  }
}
