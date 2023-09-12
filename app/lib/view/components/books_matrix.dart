import 'package:app/view/components/books_row.dart';
import 'package:flutter/material.dart';

class BooksMatrix extends StatelessWidget {
  const BooksMatrix({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = MediaQuery.of(context).size.height / 72;
    final topGap = MediaQuery.of(context).size.height / 12;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
        children: [
            Padding(
              padding: EdgeInsets.only(top: topGap),
              child: const BooksRow(imagePaths: [
                  'https://image.mechacomi.jp/contents/001fr2hw.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hx.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hy.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hz.jpg',
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: gap),
              child: const BooksRow(imagePaths: [
                  'https://image.mechacomi.jp/contents/002mciea.jpg',
                  'https://image.mechacomi.jp/contents/511ecbe0-02ac-4fd1-9e33-e02fc67fc065.jpg',
                  'https://image.mechacomi.jp/contents/002aa358-c13e-4982-85df-d653e4a025db.jpg',
                  'https://image.mechacomi.jp/contents/31473bc5-f79d-477a-94e6-dd68c6fc3922.jpg',
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: gap),
              child: const BooksRow(imagePaths: [
                  'https://image.mechacomi.jp/contents/001fr4ui.jpg',
                  'https://image.mechacomi.jp/contents/001fr4uj.jpg',
                  'https://image.mechacomi.jp/contents/001fr4uk.jpg',
                  'https://image.mechacomi.jp/contents/001fr4ul.jpg',
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: gap),
              child: const BooksRow(imagePaths: [
                  'https://image.mechacomi.jp/contents/001t1cxw.jpg',
                  'https://image.mechacomi.jp/contents/001uvekb.jpg',
                  'https://image.mechacomi.jp/contents/001ycldh.jpg',
                  'https://image.mechacomi.jp/contents/0021rdz4.jpg',
                ]
              )
            )
        ]
      ),]
    );
  }
}