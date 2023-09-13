import 'dart:ffi';

import 'package:app/view/components/books_row.dart';
import 'package:app/view/pages/bookshelf.dart';
import 'package:app/view/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:app/logic/database.dart';

class BooksMatrix extends StatefulWidget {
  BooksMatrix({super.key});
  @override
  State<BooksMatrix> createState() => _BooksMatrix();
}

class _BooksMatrix extends State<BooksMatrix> {
  void reload() {}
  //本棚に表示するurlのリスト
  @override
  Widget build(BuildContext context) {
    const gap = 40.0;
    final topGap = MediaQuery.of(context).size.height / 12;
    List<String?> bookShelfImages = [
      'https://image.mechacomi.jp/contents/002cwtgk.jpg',
      'https://image.mechacomi.jp/contents/002cwtgl.jpg',
      'https://image.mechacomi.jp/contents/002cwtgm.jpg',
      'https://image.mechacomi.jp/contents/002cwtgn.jpg',
      'https://image.mechacomi.jp/contents/0027b2zi.jpg',
      'https://image.mechacomi.jp/contents/002ba6bb.jpg',
      'https://image.mechacomi.jp/contents/002f7nkl.jpg',
      'https://image.mechacomi.jp/contents/002hh21c.jpg',
      'https://image.mechacomi.jp/contents/ee70128a-98c5-46dc-be2e-cb76d1738ff0.jpg',
      'https://image.mechacomi.jp/contents/e8b1e906-ad23-409f-ac48-c99d08b18bbf.jpg',
      'https://image.mechacomi.jp/contents/6a6c58aa-1d09-48af-adae-ebb0c6f42950.jpg',
      'https://image.mechacomi.jp/titles/538376.jpg',
      'https://image.mechacomi.jp/contents/002kfyu2.jpg',
      'https://image.mechacomi.jp/contents/002kfyu4.jpg',
      'https://image.mechacomi.jp/contents/002kfyu6.jpg',
      'https://image.mechacomi.jp/contents/002kfyu8.jpg',
    ];

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(children: [
        TextButton(
            onPressed: () async {
              final dbHelper = DatabaseHelper.instance;
              final allRows = await dbHelper.queryAllRows();
              setState(() {
                List<String?> copy = bookShelfImages;
                for (int i = 15; i > 0; i--) {
                  copy[i] = copy[i - 1];
                }
                bookShelfImages[0] = allRows[0].urlImage;
                if (allRows[0].urlImage == null) {
                  copy[0] =
                      'https://c.mechacomic.jp/images/book/90/89/89685/dragonball_xl.jpg?5e36899881fdf75247bd68a0ebf1b8f14a46722d859334563a96c3bc5011b18c';
                }
                bookShelfImages = copy;
                debugPrint(bookShelfImages[0]);
              });
            },
            child: Text(
              '更新',
              style: (TextStyle(fontSize: 10)),
            )),
        Padding(
          padding: EdgeInsets.only(top: topGap),
          child: BooksRow(imagePaths: [
            bookShelfImages[0]!,
            bookShelfImages[1]!,
            bookShelfImages[2]!,
            bookShelfImages[3]!,
          ]),
        ),
        Padding(
            padding: EdgeInsets.only(top: gap),
            child: BooksRow(imagePaths: [
              bookShelfImages[4]!,
              bookShelfImages[5]!,
              bookShelfImages[6]!,
              bookShelfImages[7]!,
            ])),
        Padding(
            padding: EdgeInsets.only(top: gap),
            child: BooksRow(imagePaths: [
              bookShelfImages[8]!,
              bookShelfImages[9]!,
              bookShelfImages[10]!,
              bookShelfImages[11]!,
            ])),
        Padding(
            padding: EdgeInsets.only(top: gap),
            child: BooksRow(imagePaths: [
              bookShelfImages[12]!,
              bookShelfImages[13]!,
              bookShelfImages[14]!,
              bookShelfImages[15]!,
            ]))
      ]),
    ]);
  }
}
