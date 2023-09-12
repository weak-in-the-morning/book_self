import 'package:app/view/components/books_row.dart';
import 'package:flutter/material.dart';

class BooksMatrix extends StatelessWidget {
  const BooksMatrix({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = 40.0;
    final topGap = MediaQuery.of(context).size.height / 12;

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(children: [
        Padding(
          padding: EdgeInsets.only(top: topGap),
          child: const BooksRow(imagePaths: [
            'https://image.mechacomi.jp/contents/002cwtgk.jpg',
            'https://image.mechacomi.jp/contents/002cwtgl.jpg',
            'https://image.mechacomi.jp/contents/002cwtgm.jpg',
            'https://image.mechacomi.jp/contents/002cwtgn.jpg',
          ]),
        ),
        Padding(
            padding: EdgeInsets.only(top: gap),
            child: const BooksRow(imagePaths: [
              'https://image.mechacomi.jp/contents/0027b2zi.jpg',
              'https://image.mechacomi.jp/contents/002ba6bb.jpg',
              'https://image.mechacomi.jp/contents/002f7nkl.jpg',
              'https://image.mechacomi.jp/contents/002hh21c.jpg',
            ])),
        Padding(
            padding: EdgeInsets.only(top: gap),
            child: const BooksRow(imagePaths: [
              'https://image.mechacomi.jp/contents/ee70128a-98c5-46dc-be2e-cb76d1738ff0.jpg',
              'https://image.mechacomi.jp/contents/e8b1e906-ad23-409f-ac48-c99d08b18bbf.jpg',
              'https://image.mechacomi.jp/contents/6a6c58aa-1d09-48af-adae-ebb0c6f42950.jpg',
              'https://image.mechacomi.jp/titles/538376.jpg',
            ])),
        Padding(
            padding: EdgeInsets.only(top: gap),
            child: const BooksRow(imagePaths: [
              'https://image.mechacomi.jp/contents/002kfyu2.jpg',
              'https://image.mechacomi.jp/contents/002kfyu4.jpg',
              'https://image.mechacomi.jp/contents/002kfyu6.jpg',
              'https://image.mechacomi.jp/contents/002kfyu8.jpg',
            ]))
      ]),
    ]);
  }
}
